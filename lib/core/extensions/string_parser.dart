import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringParser on String {
  Color toColor() {
    String hashColor = replaceAll("#", "0xff");
    return Color(int.parse(hashColor));
  }

  Widget toSvg({ColorFilter? colorFilter, double? width, double? height}) {
    return SvgPicture.asset(
      this,
      colorFilter: colorFilter,
      width: width ?? 25,
      height: height ?? 25,
      fit: BoxFit.scaleDown,
    );
  }
}

extension ColorParser on Color {
  String toHex() {
    return value.toRadixString(16).replaceRange(0, 2, "#");
  }
}
