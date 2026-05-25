import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_styles.dart';


class IsOrganicCheck extends StatefulWidget {
  const IsOrganicCheck({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheck> createState() => _IsOrganicCheckState();
}

class _IsOrganicCheckState extends State<IsOrganicCheck> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: RichText(
            textDirection: Directionality.of(context),
            text: TextSpan(
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xff949D9E),
                fontFamily: 'Cairo',
                height: 1.4,
              ),
              children: [
                TextSpan(text: "Is organic item ? " ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 28,
          height: 28,
          child: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isChecked,
              onChanged: (val) {
                if (val != null) {
                  setState(() => isChecked = val);
                  widget.onChanged(val);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}