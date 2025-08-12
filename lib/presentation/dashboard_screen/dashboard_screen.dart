import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_image_view.dart';
import './models/location_item_model.dart';
import './widgets/location_card_widget.dart';
import 'notifier/dashboard_notifier.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFFF8F5,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      _buildWelcomeMessage(),
                      SizedBox(height: 24.h),
                      _buildMapSection(),
                      SizedBox(height: 24.h),
                      _buildAutomatenSection(),
                      SizedBox(height: 24.h),
                      _buildHofladenSection(),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: 'Buurnsnack',
      buttonText: 'Zurück zur',
      secondaryButtonText: 'Kundenansicht',
      showBackIcon: true,
      hasRoundedCorners: true,
      onCustomerViewTap: () {
        onTapCustomerView();
      },
    );
  }

  /// Section Widget
  Widget _buildWelcomeMessage() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(dashboardNotifierProvider);
        return Text(
          'Willkommen, ${state.dashboardModel?.userName ?? '[Name]'}!',
          style: TextStyleHelper.instance.headline27Bold.copyWith(height: 1.22),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildMapSection() {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFDDD6,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIGreen80030x22,
            height: 30.h,
            width: 22.h,
          ),
          SizedBox(height: 16.h),
          Text(
            'Standorte deiner Verkaufspunkte',
            textAlign: TextAlign.center,
            style:
                TextStyleHelper.instance.body14Regular.copyWith(height: 1.21),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAutomatenSection() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(dashboardNotifierProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Automaten',
              style: TextStyleHelper.instance.title17SemiBold
                  .copyWith(height: 1.24),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.dashboardModel?.automatenList?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final location = state.dashboardModel?.automatenList![index];
                return LocationCardWidget(
                  locationItemModel: location!,
                  onTapManage: () => onTapManage(location),
                  onTapSortiment: () => onTapSortiment(location),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  Widget _buildHofladenSection() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(dashboardNotifierProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hofläden',
              style: TextStyleHelper.instance.title17SemiBold
                  .copyWith(height: 1.24),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.dashboardModel?.hofladenList?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final location = state.dashboardModel?.hofladenList![index];
                return LocationCardWidget(
                  locationItemModel: location!,
                  onTapManage: () => onTapManage(location),
                  onTapSortiment: () => onTapSortiment(location),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottomNavBar(BuildContext context) {
    return CustomBottomNavBar(
      bottomBarItemList: [
        CustomBottomNavItem(
          icon: ImageConstant.imgHome11,
          activeIcon: ImageConstant.imgHome11Green800,
          title: 'Start',
          routeName: '/start',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgStore01,
          activeIcon: ImageConstant.imgStore01Green800,
          title: 'Shop',
          routeName: '/shop',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgDeliverybox01,
          activeIcon: ImageConstant.imgDeliverybox01,
          title: 'Sortiment',
          routeName: '/sortiment',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgChart01,
          activeIcon: ImageConstant.imgChart01,
          title: 'Statistik',
          routeName: '/statistik',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgUser03,
          activeIcon: ImageConstant.imgUser03,
          title: 'Profil',
          routeName: '/profil',
        ),
      ],
      selectedIndex: 0,
      onChanged: (index) {
        onTapBottomNavigation(index);
      },
    );
  }

  /// Handles customer view navigation
  void onTapCustomerView() {
    // Add customer view logic
  }

  /// Handles manage button tap for location
  void onTapManage(LocationItemModel location) {
    NavigatorService.pushNamed(AppRoutes.vendingMachineManagementScreen);
  }

  /// Handles sortiment button tap for location
  void onTapSortiment(LocationItemModel location) {
    NavigatorService.pushNamed(AppRoutes.productAssortmentManagementScreen);
  }

  /// Handles bottom navigation
  void onTapBottomNavigation(int index) {
    switch (index) {
      case 0:
        // Already on start/dashboard
        break;
      case 1:
        NavigatorService.pushNamed(AppRoutes.salesPointManagementScreen);
        break;
      case 2:
        NavigatorService.pushNamed(AppRoutes.productAssortmentManagementScreen);
        break;
      case 3:
        NavigatorService.pushNamed(AppRoutes.salesStatisticsDashboardScreen);
        break;
      case 4:
        NavigatorService.pushNamed(AppRoutes.profileSetupScreen);
        break;
    }
  }
}
