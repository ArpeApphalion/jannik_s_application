import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';

class ChartWidget extends StatelessWidget {
  final String title;
  final String chartImage;
  final double chartWidth;
  final double chartHeight;

  ChartWidget({
    Key? key,
    required this.title,
    required this.chartImage,
    required this.chartWidth,
    required this.chartHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272.h,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(12.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blackCustom.withAlpha(13),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                TextStyleHelper.instance.title16Medium.copyWith(height: 1.25),
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: Center(
              child: CustomImageView(
                imagePath: chartImage,
                height: chartHeight,
                width: chartWidth,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
