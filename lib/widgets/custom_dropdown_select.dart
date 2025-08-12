import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomDropdownSelect - A customizable dropdown select component
 * 
 * This widget provides a styled dropdown selection with custom appearance
 * including rounded corners, shadow, and custom dropdown icon.
 * 
 * @param options List of dropdown options to display
 * @param selectedValue Currently selected option value
 * @param onChanged Callback function triggered when selection changes
 * @param hint Placeholder text when no option is selected
 * @param dropdownIcon Path to custom dropdown icon image
 * @param backgroundColor Background color of the dropdown
 * @param textColor Text color for the dropdown options
 * @param borderRadius Border radius for rounded corners
 * @param fontSize Font size for the dropdown text
 * @param height Height of the dropdown container
 * @param width Width of the dropdown container
 */
class CustomDropdownSelect extends StatelessWidget {
  const CustomDropdownSelect({
    Key? key,
    required this.options,
    this.selectedValue,
    required this.onChanged,
    this.hint,
    this.dropdownIcon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.height,
    this.width,
  }) : super(key: key);

  /// List of dropdown options with display text and values
  final List<CustomDropdownOption> options;

  /// Currently selected option value
  final String? selectedValue;

  /// Callback function when selection changes
  final Function(String?) onChanged;

  /// Placeholder text when no option is selected
  final String? hint;

  /// Path to custom dropdown icon image
  final String? dropdownIcon;

  /// Background color of the dropdown
  final Color? backgroundColor;

  /// Text color for the dropdown options
  final Color? textColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Font size for the dropdown text
  final double? fontSize;

  /// Height of the dropdown container
  final double? height;

  /// Width of the dropdown container
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width ?? 120.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(borderRadius ?? 20.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blackCustom.withAlpha(26),
            blurRadius: 4.h,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 8.h,
          ),
          border: InputBorder.none,
          hintText: hint ?? 'Zeitraum',
          hintStyle: TextStyleHelper.instance.bodyTextMedium
              .copyWith(color: textColor ?? Color(0xFF2E2E2E)),
        ),
        style: TextStyleHelper.instance.bodyTextMedium
            .copyWith(color: textColor ?? Color(0xFF2E2E2E)),
        dropdownColor: backgroundColor ?? appTheme.whiteCustom,
        icon: CustomImageView(
          imagePath: dropdownIcon ?? ImageConstant.img,
          height: 16.h,
          width: 16.h,
        ),
        iconSize: 0,
        isExpanded: true,
        items: options
            .map<DropdownMenuItem<String>>((CustomDropdownOption option) {
          return DropdownMenuItem<String>(
            value: option.value,
            child: Text(
              option.text,
              style: TextStyleHelper.instance.bodyTextMedium
                  .copyWith(color: textColor ?? Color(0xFF2E2E2E)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Data model for dropdown options
class CustomDropdownOption {
  const CustomDropdownOption({
    required this.text,
    required this.value,
  });

  /// Display text for the option
  final String text;

  /// Value associated with the option
  final String value;
}
