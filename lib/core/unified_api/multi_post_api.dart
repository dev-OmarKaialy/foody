import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../extensions/log_colors_extension.dart';
import '../services/shared_preferences_service.dart';
import 'handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class MultiPostApi with HandlingExceptionRequest {
  final Uri uri;
  final Map<String, String?> body;
  final Map<String, String>? files;
  final FromJson fromJson;
  final Duration timeout;

  const MultiPostApi({
    required this.uri,
    required this.body,
    required this.files,
    required this.fromJson,
    this.timeout = const Duration(seconds: 20),
  });

  Future<dynamic> callRequest() async {
    try {
      final token = SharedPreferencesService.getToken();
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': "Bearer $token"
      };
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      if (files != null) {
        for (var item in files!.entries) {
          try {
            request.files
                .add(await http.MultipartFile.fromPath(item.key, item.value));
          } catch (e) {
            request.fields.addAll({item.key: item.value});
          }
        }
      }
      request.fields.addAll(body.cast());
      log(request.fields.toString().logGreen);
      log(request.files
          .map((e) {
            return e.field + e.filename!;
          })
          .toString()
          .logGreen);

      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      http.Response response = await http.Response.fromStream(streamedResponse);
      log(response.body.logGreen);
      log(response.statusCode.toString().logGreen);
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception'.logRed,
        name: 'RequestManager post function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri'.logRed,
        name: 'RequestManager post function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception'.logRed,
        name: 'RequestManager post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString().logRed,
        name: 'RequestManager post function',
      );
      rethrow;
    }
  }
}
