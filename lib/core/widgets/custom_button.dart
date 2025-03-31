import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    this.onTap,
    this.radius,
    this.textStyle,
    super.key,
  });

  final String title;
  final Function()? onTap;
  final BorderRadius? radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: radius ?? BorderRadius.circular(7.5),
      color: AColors.elevatedButton,
      child: InkWell(
        borderRadius: radius ?? BorderRadius.circular(7.5),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            title,
            style: textStyle ?? Theme.of(context).textTheme.bodyMedium!.copyWith(color: AColors.buttonColor),
          ),
        ),
      ),
    );
  }
}
