import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'notifier/profile_setup_notifier.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  ProfileSetupScreenState createState() => ProfileSetupScreenState();
}

class ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFFF8F5,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImageUploadSection(),
                      SizedBox(height: 32.h),
                      _buildIntroductionTextSection(),
                      SizedBox(height: 32.h),
                      _buildCustomerProfilePreview(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      title: 'Buurnsnack',
      buttonText: '← Kundenansicht',
      onCustomerViewTap: () {
        onTapCustomerView();
      },
    );
  }

  /// Section Widget
  Widget _buildImageUploadSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                onTapImageUpload();
              },
              child: Container(
                width: 150.h,
                height: 150.h,
                decoration: BoxDecoration(
                  color: appTheme.whiteCustom,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: appTheme.colorFFCCCC,
                    width: 2.h,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgDiv,
                      height: 48.h,
                      width: 48.h,
                      color: appTheme.colorFF3C6E,
                    ),
                    Positioned(
                      bottom: 8.h,
                      right: 8.h,
                      child: GestureDetector(
                        onTap: () {
                          onTapCameraIcon();
                        },
                        child: Container(
                          width: 32.h,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: appTheme.colorFF3C6E,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.img2,
                              height: 16.h,
                              width: 16.h,
                              color: appTheme.whiteCustom,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Hofbild oder Portrait',
              style: TextStyleHelper.instance.body14Regular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            onTapSettings();
          },
          child: CustomImageView(
            imagePath: ImageConstant.imgSetting07,
            height: 24.h,
            width: 24.h,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildIntroductionTextSection() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(profileSetupNotifier);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vorstellungstext',
              style: TextStyleHelper.instance.body14Medium,
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.maxFinite,
              height: 128.h,
              decoration: BoxDecoration(
                color: appTheme.whiteCustom,
                border: Border.all(
                  color: appTheme.colorFFCCCC,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(16.h),
              ),
              child: TextFormField(
                controller: state.introductionController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                style: TextStyleHelper.instance.title16Regular,
                decoration: InputDecoration(
                  hintText: 'Beschreibe deinen Hof und deine Produkte...',
                  hintStyle: TextStyleHelper.instance.title16Regular
                      .copyWith(color: appTheme.colorFFADAE),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.h),
                ),
                onChanged: (value) {
                  ref
                      .read(profileSetupNotifier.notifier)
                      .updateIntroductionText(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCustomerProfilePreview() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(profileSetupNotifier);
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            color: appTheme.colorFFF1EC,
            borderRadius: BorderRadius.circular(16.h),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFrameGreen80016x18,
                    height: 16.h,
                    width: 18.h,
                  ),
                  SizedBox(width: 12.h),
                  Text(
                    'So sehen Kunden dein Profil',
                    style: TextStyleHelper.instance.title18SemiBold,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: appTheme.whiteCustom,
                  borderRadius: BorderRadius.circular(12.h),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 64.h,
                          height: 64.h,
                          decoration: BoxDecoration(
                            color: appTheme.colorFFE2DD,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIGreen80064x64,
                              height: 32.h,
                              width: 32.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '[Dein Name]',
                                style: TextStyleHelper.instance.title16Medium,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Hofname oder Rolle',
                                style: TextStyleHelper.instance.body14Regular
                                    .copyWith(color: appTheme.colorFF6666),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      (state.introductionController?.text.isNotEmpty ?? false)
                          ? state.introductionController!.text
                          : 'Vorschau deines Vorstellungstextes...',
                      style: TextStyleHelper.instance.body14Regular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation() {
    return CustomBottomNavBar(
      bottomBarItemList: [
        CustomBottomNavItem(
          icon: ImageConstant.imgHome11,
          activeIcon: ImageConstant.imgHome11Green800,
          title: 'Start',
          routeName: AppRoutes.salesPointManagementScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgStore01,
          activeIcon: ImageConstant.imgStore01Green800,
          title: 'Shop',
          routeName: AppRoutes.dashboardScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgDeliverybox01,
          activeIcon: ImageConstant.imgDeliverybox01Green800,
          title: 'Sortiment',
          routeName: AppRoutes.productAssortmentManagementScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgChart01,
          activeIcon: ImageConstant.imgChart01Green800,
          title: 'Statistik',
          routeName: AppRoutes.salesStatisticsDashboardScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgUser03Green800,
          activeIcon: ImageConstant.imgUser03Green800,
          title: 'Profil',
          routeName: AppRoutes.profileSetupScreen,
        ),
      ],
      selectedIndex: 4,
      onChanged: (index) {
        onTapBottomNavigation(index);
      },
    );
  }

  /// Handles customer view toggle
  void onTapCustomerView() {
    // Handle customer view functionality
  }

  /// Handles image upload functionality
  void onTapImageUpload() {
    // Handle image upload dialog
  }

  /// Handles camera icon tap
  void onTapCameraIcon() {
    // Handle camera functionality
  }

  /// Handles settings navigation
  void onTapSettings() {
    // Handle settings navigation
  }

  /// Handles bottom navigation tap
  void onTapBottomNavigation(int index) {
    final routes = [
      AppRoutes.salesPointManagementScreen,
      AppRoutes.dashboardScreen,
      AppRoutes.productAssortmentManagementScreen,
      AppRoutes.salesStatisticsDashboardScreen,
      AppRoutes.profileSetupScreen,
    ];

    if (index < routes.length && index != 4) {
      NavigatorService.pushNamed(routes[index]);
    }
  }
}
