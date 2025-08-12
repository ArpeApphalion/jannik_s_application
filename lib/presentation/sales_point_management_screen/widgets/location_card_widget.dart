import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/location_item_model.dart';

class LocationCardWidget extends StatelessWidget {
  final LocationItemModel location;
  final VoidCallback? onManageTap;
  final VoidCallback? onSortimentTap;
  final VoidCallback? onStatisticsTap;

  const LocationCardWidget({
    Key? key,
    required this.location,
    this.onManageTap,
    this.onSortimentTap,
    this.onStatisticsTap,
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
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          _buildLocationInfo(context),
          SizedBox(height: 16.h),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              location.image ?? 'IMG\n56×56',
              style: TextStyleHelper.instance.body12.copyWith(height: 1.2),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 16.h),
              _buildLocationDetails(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            location.name ?? '',
            style:
                TextStyleHelper.instance.title16SemiBold.copyWith(height: 1.0),
          ),
        ),
        SizedBox(width: 8.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              decoration: BoxDecoration(
                color: location.type == 'Automat'
                    ? Color(0xFF3C6E47)
                    : appTheme.colorFF4376,
                borderRadius: BorderRadius.circular(4.h),
              ),
              child: Text(
                location.type ?? '',
                style: TextStyleHelper.instance.body12
                    .copyWith(color: appTheme.whiteCustom, height: 1.25),
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              decoration: BoxDecoration(
                color: (location.isActive ?? false)
                    ? Color(0xFFE2F7E1)
                    : appTheme.colorFFF6F7,
                borderRadius: BorderRadius.circular(4.h),
              ),
              child: Text(
                location.status ?? '',
                style: TextStyleHelper.instance.body12Medium.copyWith(
                    color: (location.isActive ?? false)
                        ? Color(0xFF34784F)
                        : appTheme.colorFF8B7E,
                    height: 1.25),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: location.type == 'Hofladen'
                  ? ImageConstant.imgFrameBlueGray60012x9
                  : ImageConstant.imgFrameGreen800,
              height: 12.h,
              width: 9.h,
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: Text(
                location.address ?? '',
                style: TextStyleHelper.instance.body13.copyWith(height: 1.23),
              ),
            ),
            Text(
              ' •',
              style: TextStyleHelper.instance.body13
                  .copyWith(color: appTheme.colorFFC9B7, height: 1.23),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgFrameBlueGray600,
              height: 12.h,
              width: 12.h,
            ),
            SizedBox(width: 8.h),
            Text(
              location.hours ?? '',
              style: TextStyleHelper.instance.body13.copyWith(height: 1.23),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onManageTap,
            icon: CustomImageView(
              imagePath: ImageConstant.imgIWhiteA700,
              height: 14.h,
              width: 14.h,
            ),
            label: Text('Verwalten'),
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.colorFF3C6E,
              foregroundColor: appTheme.whiteCustom,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              textStyle:
                  TextStyleHelper.instance.body14Medium.copyWith(height: 1.21),
            ),
          ),
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onSortimentTap,
            icon: CustomImageView(
              imagePath: ImageConstant.imgIWhiteA70014x14,
              height: 14.h,
              width: 14.h,
            ),
            label: Text('Sortiment'),
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.colorFF4376,
              foregroundColor: appTheme.whiteCustom,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              textStyle:
                  TextStyleHelper.instance.body14Medium.copyWith(height: 1.21),
            ),
          ),
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onStatisticsTap,
            icon: CustomImageView(
              imagePath: ImageConstant.imgIGreen700,
              height: 14.h,
              width: 14.h,
            ),
            label: Text('Statistik'),
            style: ElevatedButton.styleFrom(
              backgroundColor: appTheme.colorFFE2DD,
              foregroundColor: appTheme.colorFF3478,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.h),
              ),
              textStyle:
                  TextStyleHelper.instance.body14Medium.copyWith(height: 1.21),
            ),
          ),
        ),
      ],
    );
  }
}
