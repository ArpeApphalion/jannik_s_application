import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomNavBar - A customizable bottom navigation bar widget
 * 
 * Features:
 * - Supports multiple navigation items with icons and labels
 * - Active/inactive state management
 * - Customizable styling and layout
 * - Navigation callback support
 * - Responsive design with SizeUtils
 * 
 * @param bottomBarItemList - List of navigation items to display
 * @param onChanged - Callback function when a tab is tapped
 * @param selectedIndex - Currently selected tab index (default: 0)
 * @param backgroundColor - Background color of the bottom bar
 * @param borderRadius - Top border radius of the container
 * @param padding - Internal padding of the container
 * @param itemSpacing - Spacing between navigation items
 */
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.itemSpacing,
  }) : super(key: key);

  /// List of bottom navigation bar items
  final List<CustomBottomNavItem> bottomBarItemList;

  /// Callback function triggered when a tab is tapped, provides the index
  final Function(int) onChanged;

  /// Currently selected tab index
  final int? selectedIndex;

  /// Background color of the bottom navigation bar
  final Color? backgroundColor;

  /// Border radius for the top corners
  final BorderRadius? borderRadius;

  /// Padding around the navigation items
  final EdgeInsetsGeometry? padding;

  /// Spacing between navigation items
  final double? itemSpacing;

  @override
  Widget build(BuildContext context) {
    final int currentIndex = selectedIndex ?? 0;
    final Color bgColor = backgroundColor ?? Color(0xFFF1ECE3);
    final BorderRadius radius = borderRadius ??
        BorderRadius.only(
          topLeft: Radius.circular(16.h),
          topRight: Radius.circular(16.h),
        );
    final EdgeInsetsGeometry containerPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 12.h,
        );
    final double spacing = itemSpacing ?? 32.h;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
      ),
      padding: containerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(bottomBarItemList.length, (index) {
          final bool isSelected = currentIndex == index;
          final CustomBottomNavItem item = bottomBarItemList[index];

          return Expanded(
            child: InkWell(
              onTap: () {
                onChanged(index);
              },
              borderRadius: BorderRadius.circular(8.h),
              child: _buildNavItem(item, isSelected),
            ),
          );
        }),
      ),
    );
  }

  /// Builds individual navigation item widget
  Widget _buildNavItem(CustomBottomNavItem item, bool isSelected) {
    final Color textColor = appTheme.colorFF3C6E;
    final FontWeight fontWeight =
        isSelected ? FontWeight.w600 : FontWeight.w400;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: isSelected ? item.activeIcon : item.icon,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(height: 4.h),
          Text(
            item.title,
            style: TextStyleHelper.instance.body12.copyWith(height: 1.25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Data model for bottom navigation bar items
class CustomBottomNavItem {
  const CustomBottomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.routeName,
  });

  /// Path to the inactive state icon
  final String icon;

  /// Path to the active state icon
  final String activeIcon;

  /// Display title for the navigation item
  final String title;

  /// Route name for navigation purposes
  final String routeName;
}
