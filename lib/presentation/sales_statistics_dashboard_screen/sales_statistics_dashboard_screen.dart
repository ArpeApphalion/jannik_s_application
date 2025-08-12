import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_dropdown_select.dart';
import '../../widgets/custom_image_view.dart';
import './models/statistics_card_model.dart';
import './widgets/chart_widget.dart';
import './widgets/statistics_card_widget.dart';
import 'notifier/sales_statistics_dashboard_notifier.dart';

class SalesStatisticsDashboardScreen extends ConsumerStatefulWidget {
  @override
  SalesStatisticsDashboardScreenState createState() =>
      SalesStatisticsDashboardScreenState();
}

class SalesStatisticsDashboardScreenState
    extends ConsumerState<SalesStatisticsDashboardScreen> {
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
                      _buildPageTitle(context),
                      SizedBox(height: 16.h),
                      _buildFilterDropdowns(context),
                      SizedBox(height: 20.h),
                      _buildStatisticsCardsRow1(context),
                      SizedBox(height: 8.h),
                      _buildStatisticsCardsRow2(context),
                      SizedBox(height: 20.h),
                      _buildChartsList(context),
                      SizedBox(height: 20.h),
                      _buildExportButton(context),
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

  Widget _buildPageTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrameGreen80020x20,
            height: 20.h,
            width: 20.h,
          ),
          SizedBox(width: 12.h),
          Text(
            'Verkaufsstatistiken',
            style: TextStyleHelper.instance.title20Bold2.copyWith(height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdowns(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesStatisticsDashboardNotifier);

        return Row(
          children: [
            Expanded(
              child: CustomDropdownSelect(
                options: [
                  CustomDropdownOption(text: 'Zeitraum', value: 'zeitraum'),
                  CustomDropdownOption(text: 'Heute', value: 'heute'),
                  CustomDropdownOption(text: 'Diese Woche', value: 'woche'),
                  CustomDropdownOption(text: 'Dieser Monat', value: 'monat'),
                ],
                selectedValue: state.selectedTimeFilter,
                onChanged: (value) {
                  ref
                      .read(salesStatisticsDashboardNotifier.notifier)
                      .updateTimeFilter(value);
                },
                hint: 'Zeitraum',
                width: 120.h,
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: CustomDropdownSelect(
                options: [
                  CustomDropdownOption(
                      text: 'Verkaufspunkt', value: 'verkaufspunkt'),
                  CustomDropdownOption(text: 'Laden', value: 'laden'),
                  CustomDropdownOption(text: 'Online', value: 'online'),
                  CustomDropdownOption(text: 'Markt', value: 'markt'),
                ],
                selectedValue: state.selectedSalesPoint,
                onChanged: (value) {
                  ref
                      .read(salesStatisticsDashboardNotifier.notifier)
                      .updateSalesPointFilter(value);
                },
                hint: 'Verkaufspunkt',
                width: 160.h,
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: CustomDropdownSelect(
                options: [
                  CustomDropdownOption(text: 'Produkt', value: 'produkt'),
                  CustomDropdownOption(text: 'Eier', value: 'eier'),
                  CustomDropdownOption(text: 'Milch', value: 'milch'),
                  CustomDropdownOption(text: 'Gemüse', value: 'gemuese'),
                ],
                selectedValue: state.selectedProduct,
                onChanged: (value) {
                  ref
                      .read(salesStatisticsDashboardNotifier.notifier)
                      .updateProductFilter(value);
                },
                hint: 'Produkt',
                width: 112.h,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatisticsCardsRow1(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesStatisticsDashboardNotifier);

        return Row(
          children: [
            Expanded(
              child: StatisticsCardWidget(
                statisticsCard:
                    state.salesStatisticsDashboardModel?.statisticsCards?[0] ??
                        StatisticsCardModel(),
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: StatisticsCardWidget(
                statisticsCard:
                    state.salesStatisticsDashboardModel?.statisticsCards?[1] ??
                        StatisticsCardModel(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatisticsCardsRow2(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesStatisticsDashboardNotifier);

        return Row(
          children: [
            Expanded(
              child: StatisticsCardWidget(
                statisticsCard:
                    state.salesStatisticsDashboardModel?.statisticsCards?[2] ??
                        StatisticsCardModel(),
              ),
            ),
            SizedBox(width: 8.h),
            Expanded(
              child: StatisticsCardWidget(
                statisticsCard:
                    state.salesStatisticsDashboardModel?.statisticsCards?[3] ??
                        StatisticsCardModel(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildChartsList(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesStatisticsDashboardNotifier);

        return Column(
          children: [
            ChartWidget(
              title: 'Umsatzverlauf',
              chartImage: ImageConstant.imgVector,
              chartWidth: 60.h,
              chartHeight: 52.h,
            ),
            SizedBox(height: 20.h),
            ChartWidget(
              title: 'Produkte',
              chartImage: ImageConstant.imgVectorGreen800,
              chartWidth: 60.h,
              chartHeight: 52.h,
            ),
            SizedBox(height: 20.h),
            ChartWidget(
              title: 'Umsatzanteile',
              chartImage: ImageConstant.imgVectorGreen80060x63,
              chartWidth: 64.h,
              chartHeight: 60.h,
            ),
          ],
        );
      },
    );
  }

  Widget _buildExportButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onTapExportData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.colorFFB000,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.h),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        child: Text(
          'Exportieren',
          style: TextStyleHelper.instance.title16SemiBold
              .copyWith(color: appTheme.whiteCustom),
        ),
      ),
    );
  }

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
          activeIcon: ImageConstant.imgDeliverybox01Green800,
          title: 'Sortiment',
          routeName: '/sortiment',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgChart01,
          activeIcon: ImageConstant.imgChart01Green800,
          title: 'Statistik',
          routeName: '/statistik',
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgUser03,
          activeIcon: ImageConstant.imgUser03Green800,
          title: 'Profil',
          routeName: '/profil',
        ),
      ],
      selectedIndex: 3,
      onChanged: (index) {
        onTapBottomNavigation(index);
      },
    );
  }

  void onTapCustomerView() {
    // Handle customer view toggle
  }

  void onTapExportData() {
    // Handle export functionality
  }

  void onTapBottomNavigation(int index) {
    switch (index) {
      case 0:
        NavigatorService.pushNamed(AppRoutes.dashboardScreen);
        break;
      case 1:
        NavigatorService.pushNamed(AppRoutes.salesPointManagementScreen);
        break;
      case 2:
        NavigatorService.pushNamed(AppRoutes.productAssortmentManagementScreen);
        break;
      case 3:
        // Current screen - no navigation needed
        break;
      case 4:
        NavigatorService.pushNamed(AppRoutes.profileSetupScreen);
        break;
    }
  }
}
