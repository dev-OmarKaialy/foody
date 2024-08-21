import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_extensions.dart';
import '../extensions/widget_extensions.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.shadowColor,
    this.icon,
    this.color,
    this.borderColor,
    required this.onPressed,
    this.textColor,
    this.spaceBetweenIcon,
  });

  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? spaceBetweenIcon;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Color? shadowColor;
  final Color? borderColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(50),
            side: BorderSide(
              width: .7,
              color: borderColor ?? context.primaryColor,
            ),
          ),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        backgroundColor: WidgetStatePropertyAll(color ?? context.primaryColor),
        fixedSize: WidgetStateProperty.all(
          Size(
            width ?? .2.sw,
            height ?? 48.h,
          ),
        ),
      ),
      onPressed: (onPressed != null)
          ? () {
              FocusManager.instance.primaryFocus?.unfocus();
              onPressed!();
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: icon!.withWidth(spaceBetweenIcon ?? 16.r)),
          Text(
            text,
            maxLines: 1,
            style: context.textTheme.titleLarge?.copyWith(
                color: textColor ?? context.theme.colorScheme.onPrimary,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontSize: fontSize ?? 12),
          )
        ],
      ).paddingSymmetric(horizontal: 20, vertical: 8),
    );
  }
}
