import 'dart:developer';

import '../extensions/log_colors_extension.dart';
import '../utils/type_defs.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'https';
  final _host = 'api.ewaom.com';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: _port,
      path: '/current/public/api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  Uri _customerApi({required String path, ParamsMap? params}) =>
      _mainUri(path: 'customer/$path', queryParameters: params);
  //////Auth Start///////
  Uri _authUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'customer/auth/$path', queryParameters: params);
  Uri login() => _authUri(path: 'login');
  Uri register() => _authUri(path: 'register');
  Uri verifyOtp(String id) => _authUri(path: 'verify-otp/$id');
  Uri resendOtp(String id) => _authUri(path: 'resend-otp/$id');
  Uri forgotPassword() => _authUri(path: 'forgot-password');
  Uri resetPassword(String id) => _authUri(path: 'reset-password/$id');
  Uri getProfile() => _authUri(path: 'get-customer-profile');
  Uri updateProfile() => _authUri(path: 'update-customer-profile');
  Uri updateAccount() => _authUri(path: 'update-customer-contact');
  Uri verifyUpdateProfile() => _authUri(path: 'verify-update-customer-contact');
  Uri deleteAccount() => _authUri(path: 'delete-account');
  Uri resetProfilePassword() => _authUri(path: 'reset-profile-password');

  //////Auth End///////
  //////Countries Start///////
  Uri getCountries({ParamsMap? params}) =>
      _mainUri(path: 'countries/get-countries');
  Uri getStates({ParamsMap? params}) =>
      _mainUri(path: 'states/get-states', queryParameters: params);
  Uri getCities({ParamsMap? params}) =>
      _mainUri(path: 'cities/get-cities', queryParameters: params);
  //////Countries End///////
  //////UserAddress End///////
  Uri createUserAddress() =>
      _customerApi(path: 'customer-addresses/create-customer-address');
  Uri updateUserAddress(int id) =>
      _customerApi(path: 'customer-addresses/update-customer-address/$id');
  Uri getUserAddresses({ParamsMap? params}) => _customerApi(
      path: 'customer-addresses/get-customer-addresses', params: params);
  Uri showUserAddress(int id) =>
      _customerApi(path: 'customer-addresses/get-customer-addresses/$id');
  Uri deleteUserAddress(int id) =>
      _customerApi(path: 'customer-addresses/delete-customer-address/$id');
  Uri toggleIsDefaultUserAddress(int id) =>
      _customerApi(path: 'customer-addresses/toggle-is-default/$id');
  //////Countries End///////
  //////Categories Start///////
  Uri indexCategories(ParamsMap params) => _mainUri(
      path: 'service-categories/get-service-categories',
      queryParameters: params);
  Uri getCategory(String id) =>
      _mainUri(path: 'service-categories/get-service-category/$id');
  Uri indexServices(ParamsMap params) => _mainUri(
      path: 'services/get-all-services',
      queryParameters: params); //////Categories End///////

  //////Home Screen Start///////
  Uri getHomeCategories() => _mainUri(
      path: 'service-categories/get-home-categories',
      queryParameters: {'page': '1', 'perPAge': '9'});
  Uri getHomeSlider() => _mainUri(
        path: 'sliders/get-home-slider/home-1',
      );
  Uri getHomeRandom() => _mainUri(
        path: 'service-categories/get-home-service',
      );
  //////Home Screen End///////
}
