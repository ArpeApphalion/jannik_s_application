import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomAppBar - A customizable app bar component for Buurnsnack application
 * 
 * This component provides a flexible app bar with brand title and customer view functionality.
 * Supports different button styles including simple text and icon with multi-line text.
 * 
 * @param title - The main title text displayed on the left side
 * @param buttonText - Primary button text
 * @param secondaryButtonText - Optional secondary text line for the button
 * @param showBackIcon - Whether to display the back icon in the button
 * @param hasRoundedCorners - Whether to apply rounded bottom corners
 * @param onCustomerViewTap - Callback function when customer view button is tapped
 * @param backgroundColor - Background color of the app bar
 * @param titleColor - Color of the title text
 * @param buttonBackgroundColor - Background color of the customer view button
 * @param buttonTextColor - Text color of the button
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.buttonText,
    this.secondaryButtonText,
    this.showBackIcon,
    this.hasRoundedCorners,
    this.onCustomerViewTap,
    this.backgroundColor,
    this.titleColor,
    this.buttonBackgroundColor,
    this.buttonTextColor,
  }) : super(key: key);

  /// The main title text displayed on the left side
  final String? title;

  /// Primary button text
  final String? buttonText;

  /// Optional secondary text line for the button
  final String? secondaryButtonText;

  /// Whether to display the back icon in the button
  final bool? showBackIcon;

  /// Whether to apply rounded bottom corners
  final bool? hasRoundedCorners;

  /// Callback function when customer view button is tapped
  final VoidCallback? onCustomerViewTap;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Color of the title text
  final Color? titleColor;

  /// Background color of the customer view button
  final Color? buttonBackgroundColor;

  /// Text color of the button
  final Color? buttonTextColor;

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? appTheme.colorFFF1EC,
      elevation: 0,
      toolbarHeight: 64.h,
      shape: (hasRoundedCorners ?? false)
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.h),
                bottomRight: Radius.circular(16.h),
              ),
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand Title
          Text(
            title ?? "Buurnsnack",
            style: TextStyleHelper.instance.title22BoldInter.copyWith(
                color: titleColor ?? appTheme.colorFF3C6E, height: 1.23),
          ),

          // Customer View Button
          _buildCustomerViewButton(),
        ],
      ),
    );
  }

  Widget _buildCustomerViewButton() {
    final hasSecondaryText =
        secondaryButtonText != null && secondaryButtonText!.isNotEmpty;
    final shouldShowIcon = showBackIcon ?? false;

    return GestureDetector(
      onTap: onCustomerViewTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
        decoration: BoxDecoration(
          color: buttonBackgroundColor ?? appTheme.colorFFE2DD,
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Back Icon
            if (shouldShowIcon) ...[
              CustomImageView(
                imagePath: ImageConstant.imgI,
                height: 18.h,
                width: 15.h,
              ),
              SizedBox(width: 8.h),
            ],

            // Button Text
            if (hasSecondaryText)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText ?? "Zurück zur",
                    style: TextStyleHelper.instance.body15MediumInter.copyWith(
                        color: buttonTextColor ?? appTheme.colorFF3C6E,
                        height: 1.27),
                  ),
                  Text(
                    secondaryButtonText!,
                    style: TextStyleHelper.instance.body15MediumInter.copyWith(
                        color: buttonTextColor ?? appTheme.colorFF3C6E,
                        height: 1.27),
                  ),
                ],
              )
            else
              Text(
                buttonText ?? "Kundenansicht",
                style: TextStyleHelper.instance.body14Inter.copyWith(
                    color: buttonTextColor ?? appTheme.colorFF3C6E,
                    height: 1.21),
              ),
          ],
        ),
      ),
    );
  }
}
