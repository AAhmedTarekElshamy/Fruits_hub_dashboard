

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 54,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 16,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final double height;
  final Color? backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final Color resolvedColor = backgroundColor ?? AppColors.PrimaryColor;
    final bool isDisabled = isLoading || onPressed == null;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          backgroundColor: resolvedColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
          minimumSize: Size(double.infinity, height),

          disabledBackgroundColor:
              resolvedColor.withValues(alpha: 0.6), // ✅ no withOpacity
          disabledForegroundColor:
              textColor.withValues(alpha: 0.8), // ✅ no withOpacity
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: textColor,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                style: TextStyles.bold16
                    .copyWith(color: Colors.white, fontFamily: 'Cairo'),
                label.tr(),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
