import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './widgets/location_card_widget.dart';
import 'notifier/sales_point_management_notifier.dart';

class SalesPointManagementInitialPage extends ConsumerStatefulWidget {
  const SalesPointManagementInitialPage({Key? key}) : super(key: key);

  @override
  SalesPointManagementInitialPageState createState() =>
      SalesPointManagementInitialPageState();
}

class SalesPointManagementInitialPageState
    extends ConsumerState<SalesPointManagementInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buurnsnack',
        buttonText: 'Zurück zur',
        secondaryButtonText: 'Kundenansicht',
        showBackIcon: true,
        hasRoundedCorners: true,
        onCustomerViewTap: () {
          onTapCustomerView();
        },
      ),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageTitle(context),
            SizedBox(height: 24.h),
            _buildFilterTabs(context),
            SizedBox(height: 24.h),
            Expanded(
              child: _buildLocationsList(context),
            ),
            SizedBox(height: 24.h),
            _buildAddLocationButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgFrame,
          height: 24.h,
          width: 27.h,
        ),
        SizedBox(width: 12.h),
        Text(
          'Verkaufspunkte',
          style: TextStyleHelper.instance.title20Bold.copyWith(height: 1.3),
        ),
      ],
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesPointManagementNotifier);

        return Container(
          decoration: BoxDecoration(
            color: appTheme.colorFFE2DD,
            borderRadius: BorderRadius.circular(12.h),
          ),
          padding: EdgeInsets.all(4.h),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'alle'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Alle',
                  onPressed: () {
                    ref
                        .read(salesPointManagementNotifier.notifier)
                        .updateFilter('alle');
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'automaten'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Automaten',
                  onPressed: () {
                    ref
                        .read(salesPointManagementNotifier.notifier)
                        .updateFilter('automaten');
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'hoflaeden'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Hofläden',
                  onPressed: () {
                    ref
                        .read(salesPointManagementNotifier.notifier)
                        .updateFilter('hoflaeden');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLocationsList(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(salesPointManagementNotifier);
        final filteredLocations = state.getFilteredLocations();

        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemCount: filteredLocations.length,
          itemBuilder: (context, index) {
            final location = filteredLocations[index];
            return LocationCardWidget(
              location: location,
              onManageTap: () {
                onTapManageLocation(location.id ?? '');
              },
              onSortimentTap: () {
                onTapManageSortiment(location.id ?? '');
              },
              onStatisticsTap: () {
                onTapViewStatistics(location.id ?? '');
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAddLocationButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {
          onTapAddLocation();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.colorFF3C6E,
          foregroundColor: appTheme.whiteCustom,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.h),
          ),
          elevation: 2,
        ),
        child: Text(
          '+ Verkaufspunkt hinzufügen',
          style: TextStyleHelper.instance.body15SemiBold,
        ),
      ),
    );
  }

  void onTapCustomerView() {
    // Handle customer view navigation
  }

  void onTapManageLocation(String locationId) {
    NavigatorService.pushNamed(AppRoutes.vendingMachineManagementScreen);
  }

  void onTapManageSortiment(String locationId) {
    NavigatorService.pushNamed(AppRoutes.productAssortmentManagementScreen);
  }

  void onTapViewStatistics(String locationId) {
    NavigatorService.pushNamed(AppRoutes.salesStatisticsDashboardScreen);
  }

  void onTapAddLocation() {
    // Handle add new location
  }
}
