import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './models/vending_machine_item_model.dart';
import './widgets/vending_machine_card_widget.dart';
import 'notifier/vending_machine_management_notifier.dart';

class VendingMachineManagementScreen extends ConsumerStatefulWidget {
  VendingMachineManagementScreen({Key? key}) : super(key: key);

  @override
  VendingMachineManagementScreenState createState() =>
      VendingMachineManagementScreenState();
}

class VendingMachineManagementScreenState
    extends ConsumerState<VendingMachineManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteCustom,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildHeaderSection(),
              _buildFilterTabs(),
              _buildVendingMachinesList(),
              _buildAddSalesPointButton(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(64.h),
      child: CustomAppBar(
        title: 'Buurnsnack',
        buttonText: 'Zurück zur',
        secondaryButtonText: 'Kundenansicht',
        showBackIcon: true,
        hasRoundedCorners: true,
        onCustomerViewTap: () {
          onTapCustomerView();
        },
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
      decoration: BoxDecoration(
        color: appTheme.colorFFF8F5,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFrame,
            height: 24.h,
            width: 27.h,
          ),
          SizedBox(width: 12.h),
          Text(
            'Verkaufspunkte',
            style: TextStyleHelper.instance.title20Bold,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(vendingMachineManagementNotifierProvider);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 16.h),
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: appTheme.colorFFE2DD,
            borderRadius: BorderRadius.circular(12.h),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'alle'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Alle',
                  isSelected: state.selectedFilter == 'alle',
                  onPressed: () {
                    ref
                        .read(vendingMachineManagementNotifierProvider.notifier)
                        .selectFilter('alle');
                  },
                ),
              ),
              SizedBox(width: 8.h),
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'automaten'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Automaten',
                  isSelected: state.selectedFilter == 'automaten',
                  onPressed: () {
                    ref
                        .read(vendingMachineManagementNotifierProvider.notifier)
                        .selectFilter('automaten');
                  },
                ),
              ),
              SizedBox(width: 8.h),
              Expanded(
                child: CustomButton(
                  variant: state.selectedFilter == 'hoflaeden'
                      ? CustomButtonVariant.tabSelected
                      : CustomButtonVariant.tabPlain,
                  text: 'Hofläden',
                  isSelected: state.selectedFilter == 'hoflaeden',
                  onPressed: () {
                    ref
                        .read(vendingMachineManagementNotifierProvider.notifier)
                        .selectFilter('hoflaeden');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVendingMachinesList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(vendingMachineManagementNotifierProvider);
            final filteredMachines = state.filteredVendingMachines;

            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: filteredMachines?.length ?? 0,
              itemBuilder: (context, index) {
                final machine = filteredMachines![index];
                return VendingMachineCardWidget(
                  vendingMachineItem: machine,
                  onManageTap: () {
                    onTapManage(machine);
                  },
                  onSortimentTap: () {
                    onTapSortiment(machine);
                  },
                  onStatistikTap: () {
                    onTapStatistik(machine);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildAddSalesPointButton() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.h),
      child: CustomButton(
        variant: CustomButtonVariant.textOnly,
        text: '+ Verkaufspunkt hinzufügen',
        backgroundColor: appTheme.colorFF3C6E,
        textColor: appTheme.whiteCustom,
        onPressed: () {
          onTapAddSalesPoint();
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
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
      selectedIndex: 1,
      onChanged: (index) {
        onTapBottomNavigation(index);
      },
    );
  }

  void onTapCustomerView() {
    NavigatorService.goBack();
  }

  void onTapManage(VendingMachineItemModel machine) {
    NavigatorService.pushNamed(AppRoutes.salesPointManagementScreen);
  }

  void onTapSortiment(VendingMachineItemModel machine) {
    NavigatorService.pushNamed(AppRoutes.productAssortmentManagementScreen);
  }

  void onTapStatistik(VendingMachineItemModel machine) {
    NavigatorService.pushNamed(AppRoutes.salesStatisticsDashboardScreen);
  }

  void onTapAddSalesPoint() {
    NavigatorService.pushNamed(AppRoutes.salesPointManagementScreen);
  }

  void onTapBottomNavigation(int index) {
    switch (index) {
      case 0:
        NavigatorService.pushNamed(AppRoutes.dashboardScreen);
        break;
      case 1:
        // Current screen - Shop/Vending Machines
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
