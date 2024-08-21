import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_extensions.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.listenableValue,
    // required this.value,
    this.items,
    this.onChanged,
    this.label,
    this.hint,
    this.enabled = true,
  });

  // final T? value;
  final ValueNotifier<T?> listenableValue;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? label;
  final String? hint;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 54.h,
          decoration: BoxDecoration(
            color: context.theme.highlightColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 1,
              color: context.theme.hintColor.withOpacity(0.2),
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: listenableValue,
            builder: (context, value, _) {
              return DropdownButton<T?>(
                value: value,

                hint: Text(
                  hint ?? 'Select',
                  style: context.textTheme.labelSmall?.copyWith(
                      color: enabled! ? null : context.theme.highlightColor),
                ),

                style: context.textTheme.labelSmall?.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
                borderRadius: BorderRadius.circular(8),
                // focusColor: AppColors.surfaceContainerLow(context),
                underline: const SizedBox(),
                items: items,

                onChanged: enabled!
                    ? (value) {
                        listenableValue.value = value;
                        onChanged?.call(value);
                      }
                    : null,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                padding: EdgeInsets.all(8.sp),
                isDense: true,
                // dropdownColor: AppColors.surfaceContainerLow(context),
              );
            },
          ),
        ),
        if (label != null) ...[
          PositionedDirectional(
            top: -6,
            start: 10,
            child: Text(' ${label!} ',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 9,
                  // backgroundColor:
                  // context.theme.inputDecorationTheme.fillColor),
                )),
          ),
          15.verticalSpace,
        ],
      ],
    );
  }
}
