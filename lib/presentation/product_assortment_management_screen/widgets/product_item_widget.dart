import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/product_item_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductItemModel? productItemModel;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapDelete;

  ProductItemWidget({
    Key? key,
    this.productItemModel,
    this.onTapEdit,
    this.onTapDelete,
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
            spreadRadius: 0,
            blurRadius: 2.h,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildProductImage(),
          SizedBox(width: 16.h),
          _buildProductInfo(),
          SizedBox(width: 16.h),
          _buildActionButtons(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductImage() {
    return Container(
      height: 56.h,
      width: 56.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFF0F0,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Center(
        child: Text(
          productItemModel?.imagePlaceholder ?? 'IMG\n56×56',
          textAlign: TextAlign.center,
          style: TextStyleHelper.instance.body12RegularInter
              .copyWith(height: 1.17),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productItemModel?.productName ?? '',
            style: TextStyleHelper.instance.title16SemiBoldInter
                .copyWith(height: 1.25),
          ),
          SizedBox(height: 4.h),
          Text(
            productItemModel?.price ?? '',
            style: TextStyleHelper.instance.body15SemiBoldInter
                .copyWith(height: 1.27),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildActionButtons() {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapEdit,
          child: Container(
            height: 36.h,
            width: 36.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFF8F5,
              border: Border.all(
                color: appTheme.colorFFE2DD,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(16.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.blackCustom.withAlpha(13),
                  spreadRadius: 0,
                  blurRadius: 2.h,
                  offset: Offset(0, 1.h),
                ),
              ],
            ),
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.imgIGreen800,
                height: 16.h,
                width: 16.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTapDelete,
          child: Container(
            height: 36.h,
            width: 36.h,
            decoration: BoxDecoration(
              color: appTheme.colorFFF8F5,
              border: Border.all(
                color: appTheme.colorFFE2DD,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(16.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.blackCustom.withAlpha(13),
                  spreadRadius: 0,
                  blurRadius: 2.h,
                  offset: Offset(0, 1.h),
                ),
              ],
            ),
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.imgIRed900,
                height: 16.h,
                width: 16.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
