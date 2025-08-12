import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/location_item_model.dart';

class LocationCardWidget extends StatelessWidget {
  final LocationItemModel locationItemModel;
  final VoidCallback? onTapManage;
  final VoidCallback? onTapSortiment;

  const LocationCardWidget({
    Key? key,
    required this.locationItemModel,
    this.onTapManage,
    this.onTapSortiment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(16.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.blackCustom.withAlpha(13),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.h),
      child: Row(
        children: [
          Container(
            width: 56.h,
            height: 56.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFF0F0,
              borderRadius: BorderRadius.circular(12.h),
            ),
            child: Center(
              child: Text(
                'IMG\n56×56',
                textAlign: TextAlign.center,
                style: TextStyleHelper.instance.body12Regular
                    .copyWith(color: appTheme.colorFF9999, height: 1.17),
              ),
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        locationItemModel.name ?? '',
                        style: TextStyleHelper.instance.title16SemiBold
                            .copyWith(height: 1.0),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: locationItemModel.type == 'Automat'
                                ? Color(0xFF3C6E47)
                                : appTheme.colorFF4376,
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                          child: Text(
                            locationItemModel.type ?? '',
                            style: TextStyleHelper.instance.body12Regular
                                .copyWith(
                                    color: appTheme.whiteCustom, height: 1.25),
                          ),
                        ),
                        SizedBox(width: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: (locationItemModel.isActive ?? false)
                                ? Color(0xFFE2F7E1)
                                : appTheme.colorFFF6F7,
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                          child: Text(
                            (locationItemModel.isActive ?? false)
                                ? 'Aktiv'
                                : 'Inaktiv',
                            style: TextStyleHelper.instance.body12Medium
                                .copyWith(
                                    color: (locationItemModel.isActive ?? false)
                                        ? Color(0xFF34784F)
                                        : appTheme.colorFF8B7E,
                                    height: 1.25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onTapManage,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: appTheme.colorFF3C6E,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: Center(
                            child: Text(
                              'Verwalten',
                              style: TextStyleHelper.instance.body15SemiBold
                                  .copyWith(height: 1.27),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: GestureDetector(
                        onTap: onTapSortiment,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: appTheme.colorFF4376,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: Center(
                            child: Text(
                              'Sortiment',
                              style: TextStyleHelper.instance.body15SemiBold
                                  .copyWith(height: 1.27),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
