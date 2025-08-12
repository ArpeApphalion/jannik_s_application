import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/// Enum defining different button variants
enum CustomButtonVariant {
  iconTextVertical, // Icon above text (Component 2)
  tabSelected, // Tab with background (Component 3)
  iconTextHorizontal, // Icon and text inline (Components 4, 8)
  tabPlain, // Plain text tab (Component 7)
  textOnly, // Text only with background (Component 9)
  iconOnly, // Icon only button (Component 10)
}

/// Enum defining button sizes
enum CustomButtonSize {
  small, // For icon buttons and compact elements
  medium, // Standard button size
  large, // For prominent actions
}

/**
 * CustomButton - A flexible button component that supports multiple variants
 * including icon-only, text-only, and icon+text combinations with different layouts.
 * 
 * @param text - The text to display on the button
 * @param iconPath - Path to the icon image (SVG or PNG)
 * @param variant - The visual variant of the button (required)
 * @param size - The size variant of the button
 * @param onPressed - Callback function when button is pressed
 * @param backgroundColor - Custom background color for the button
 * @param textColor - Custom text color
 * @param isSelected - Whether the button is in selected state (for tabs)
 * @param isEnabled - Whether the button is enabled
 */
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.iconPath,
    required this.variant,
    this.size,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isSelected,
    this.isEnabled,
  }) : super(key: key);

  final String? text;
  final String? iconPath;
  final CustomButtonVariant variant;
  final CustomButtonSize? size;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isSelected;
  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled ?? true;
    final bool selected = isSelected ?? false;
    final CustomButtonSize buttonSize = size ?? CustomButtonSize.medium;

    return _buildButtonByVariant(context, enabled, selected, buttonSize);
  }

  Widget _buildButtonByVariant(BuildContext context, bool enabled,
      bool selected, CustomButtonSize buttonSize) {
    switch (variant) {
      case CustomButtonVariant.iconTextVertical:
        return _buildIconTextVerticalButton(enabled, buttonSize);
      case CustomButtonVariant.tabSelected:
        return _buildTabSelectedButton(enabled, selected, buttonSize);
      case CustomButtonVariant.iconTextHorizontal:
        return _buildIconTextHorizontalButton(enabled, buttonSize);
      case CustomButtonVariant.tabPlain:
        return _buildTabPlainButton(enabled, buttonSize);
      case CustomButtonVariant.textOnly:
        return _buildTextOnlyButton(enabled, buttonSize);
      case CustomButtonVariant.iconOnly:
        return _buildIconOnlyButton(enabled, buttonSize);
    }
  }

  Widget _buildIconTextVerticalButton(
      bool enabled, CustomButtonSize buttonSize) {
    return Material(
      color: appTheme.transparentCustom,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconPath != null) ...[
                CustomImageView(
                  imagePath: iconPath!,
                  height: _getIconSize(buttonSize),
                  width: _getIconSize(buttonSize),
                ),
                SizedBox(height: 2.h),
              ],
              if (text != null)
                Text(
                  text!,
                  style: TextStyleHelper.instance.body12Regular.copyWith(
                      color: textColor ?? Color(0xFF3C6E47), height: 1.33),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabSelectedButton(
      bool enabled, bool selected, CustomButtonSize buttonSize) {
    final bgColor = backgroundColor ??
        (selected ? appTheme.whiteCustom : appTheme.transparentCustom);
    final tColor = textColor ?? Color(0xFF3C6E47);

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: tColor,
        elevation: selected ? 1 : 0,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(buttonSize),
          vertical: _getVerticalPadding(buttonSize),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
      ),
      child: Text(
        text ?? '',
        style: TextStyleHelper.instance.title16Medium.copyWith(height: 1.25),
      ),
    );
  }

  Widget _buildIconTextHorizontalButton(
      bool enabled, CustomButtonSize buttonSize) {
    final bgColor = backgroundColor ?? Color(0xFF3C6E47);
    final tColor = textColor ?? appTheme.whiteCustom;

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: tColor,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(buttonSize),
          vertical: _getVerticalPadding(buttonSize),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconPath != null) ...[
            CustomImageView(
              imagePath: iconPath!,
              height: _getIconSize(buttonSize),
              width: _getIconSize(buttonSize),
            ),
            SizedBox(width: 8.h),
          ],
          if (text != null)
            Text(
              text!,
              style:
                  TextStyleHelper.instance.body14Medium.copyWith(height: 1.21),
            ),
        ],
      ),
    );
  }

  Widget _buildTabPlainButton(bool enabled, CustomButtonSize buttonSize) {
    final tColor = textColor ?? Color(0xFF3C6E47);

    return TextButton(
      onPressed: enabled ? onPressed : null,
      style: TextButton.styleFrom(
        foregroundColor: tColor,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(buttonSize),
          vertical: _getVerticalPadding(buttonSize),
        ),
      ),
      child: Text(
        text ?? '',
        style: TextStyleHelper.instance.title16Regular.copyWith(height: 1.25),
      ),
    );
  }

  Widget _buildTextOnlyButton(bool enabled, CustomButtonSize buttonSize) {
    final bgColor = backgroundColor ?? Color(0xFFE2DDD2);
    final tColor = textColor ?? Color(0xFF3C6E47);

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: tColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(buttonSize),
          vertical: _getVerticalPadding(buttonSize),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      ),
      child: Text(
        text ?? '',
        style: TextStyleHelper.instance.body14Regular.copyWith(height: 1.14),
      ),
    );
  }

  Widget _buildIconOnlyButton(bool enabled, CustomButtonSize buttonSize) {
    final bgColor = backgroundColor ?? Color(0xFFF8F5EF);
    final borderColor = appTheme.colorFFE2DD;

    return Container(
      width: _getIconButtonSize(buttonSize),
      height: _getIconButtonSize(buttonSize),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blackCustom.withAlpha(13),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: appTheme.transparentCustom,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(16.h),
          child: Center(
            child: iconPath != null
                ? CustomImageView(
                    imagePath: iconPath!,
                    height: _getIconSize(buttonSize),
                    width: _getIconSize(buttonSize),
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  double _getIconSize(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.small:
        return 14.h;
      case CustomButtonSize.medium:
        return 16.h;
      case CustomButtonSize.large:
        return 24.h;
    }
  }

  double _getIconButtonSize(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.small:
        return 32.h;
      case CustomButtonSize.medium:
        return 36.h;
      case CustomButtonSize.large:
        return 44.h;
    }
  }

  double _getHorizontalPadding(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.small:
        return 12.h;
      case CustomButtonSize.medium:
        return 16.h;
      case CustomButtonSize.large:
        return 24.h;
    }
  }

  double _getVerticalPadding(CustomButtonSize size) {
    switch (size) {
      case CustomButtonSize.small:
        return 6.h;
      case CustomButtonSize.medium:
        return 8.h;
      case CustomButtonSize.large:
        return 12.h;
    }
  }
}
