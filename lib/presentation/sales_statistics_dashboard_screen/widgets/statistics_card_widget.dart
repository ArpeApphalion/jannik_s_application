import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/statistics_card_model.dart';

class StatisticsCardWidget extends StatelessWidget {
  final StatisticsCardModel statisticsCard;

  StatisticsCardWidget({
    Key? key,
    required this.statisticsCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(16.h),
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
            statisticsCard.title ?? '',
            style:
                TextStyleHelper.instance.body15Regular.copyWith(height: 1.33),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomImageView(
                imagePath: statisticsCard.iconPath ?? '',
                height: 20.h,
                width: 12.h,
              ),
              SizedBox(width: 8.h),
              Expanded(
                child: Text(
                  statisticsCard.value ?? '',
                  style: TextStyleHelper.instance.bodyTextBold.copyWith(
                      color: appTheme.colorFF2E2E,
                      height:
                          statisticsCard.title == 'Top Produkt' ? 1.25 : 1.16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
