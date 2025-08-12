import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/vending_machine_item_model.dart';

class VendingMachineCardWidget extends StatelessWidget {
  final VendingMachineItemModel vendingMachineItem;
  final VoidCallback? onManageTap;
  final VoidCallback? onSortimentTap;
  final VoidCallback? onStatistikTap;

  VendingMachineCardWidget({
    Key? key,
    required this.vendingMachineItem,
    this.onManageTap,
    this.onSortimentTap,
    this.onStatistikTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMachineInfoSection(),
          SizedBox(height: 24.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildMachineInfoSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          width: 56.h,
          decoration: BoxDecoration(
            color: appTheme.colorFFF0F0,
            borderRadius: BorderRadius.circular(12.h),
          ),
          child: Center(
            child: Text(
              'IMG\n56×56',
              textAlign: TextAlign.center,
              style: TextStyleHelper.instance.body12,
            ),
          ),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndStatus(),
              SizedBox(height: 16.h),
              _buildLocationInfo(),
              SizedBox(height: 8.h),
              _buildOperatingHours(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            vendingMachineItem.name ?? '',
            style: TextStyleHelper.instance.title16SemiBold,
          ),
        ),
        SizedBox(width: 8.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              decoration: BoxDecoration(
                color: appTheme.colorFF3C6E,
                borderRadius: BorderRadius.circular(4.h),
              ),
              child: Text(
                vendingMachineItem.type ?? '',
                style: TextStyleHelper.instance.body12
                    .copyWith(color: appTheme.whiteCustom),
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
              decoration: BoxDecoration(
                color: vendingMachineItem.statusColor ?? Color(0xFFE2F7E1),
                borderRadius: BorderRadius.circular(4.h),
              ),
              child: Text(
                vendingMachineItem.status ?? '',
                style: TextStyleHelper.instance.body12Medium.copyWith(
                    color: vendingMachineItem.statusTextColor ??
                        Color(0xFF34784F)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgFrameGreen800,
          height: 12.h,
          width: 8.h,
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: Text(
            vendingMachineItem.location ?? '',
            style: TextStyleHelper.instance.body13,
          ),
        ),
        Text(
          '•',
          style: TextStyleHelper.instance.body13
              .copyWith(color: appTheme.colorFFC9B7),
        ),
      ],
    );
  }

  Widget _buildOperatingHours() {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgFrameBlueGray600,
          height: 12.h,
          width: 12.h,
        ),
        SizedBox(width: 8.h),
        Text(
          vendingMachineItem.operatingHours ?? '',
          style: TextStyleHelper.instance.body13,
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            variant: CustomButtonVariant.iconTextHorizontal,
            text: 'Verwalten',
            iconPath: ImageConstant.imgIWhiteA700,
            backgroundColor: appTheme.colorFF3C6E,
            textColor: appTheme.whiteCustom,
            onPressed: onManageTap,
          ),
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: CustomButton(
            variant: CustomButtonVariant.iconTextHorizontal,
            text: 'Sortiment',
            iconPath: ImageConstant.imgIWhiteA70014x14,
            backgroundColor: appTheme.colorFF4376,
            textColor: appTheme.whiteCustom,
            onPressed: onSortimentTap,
          ),
        ),
        SizedBox(width: 8.h),
        Expanded(
          child: CustomButton(
            variant: CustomButtonVariant.iconTextHorizontal,
            text: 'Statistik',
            iconPath: ImageConstant.imgIGreen700,
            backgroundColor: appTheme.colorFFE2DD,
            textColor: appTheme.colorFF3478,
            onPressed: onStatistikTap,
          ),
        ),
      ],
    );
  }
}
