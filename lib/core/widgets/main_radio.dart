import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/context_extensions.dart';

class CustomRadio extends StatefulWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic) onChanged;
  final double size;
  final String? text;
  const CustomRadio(
      {super.key,
      required this.value,
      required this.groupValue,
      this.size = 10,
      required this.onChanged,
      this.text});

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: Border.all(color: context.theme.highlightColor),
                shape: BoxShape.circle,
                color: context.scaffoldBackgroundColor),
            child: Center(
              child: Icon(
                Icons.circle,
                size: widget.size,
                color: selected
                    ? context.primaryColor
                    : context.scaffoldBackgroundColor,
              ),
            ),
          ),
          if (widget.text != null) ...[
            5.horizontalSpace,
            Text(
              widget.text!,
              style: context.textTheme.labelSmall,
            ),
          ]
        ],
      ),
    );
  }
}
