import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import './widgets/product_item_widget.dart';
import 'notifier/product_assortment_management_notifier.dart';

class ProductAssortmentManagementScreen extends ConsumerStatefulWidget {
  ProductAssortmentManagementScreen({Key? key}) : super(key: key);

  @override
  ProductAssortmentManagementScreenState createState() =>
      ProductAssortmentManagementScreenState();
}

class ProductAssortmentManagementScreenState
    extends ConsumerState<ProductAssortmentManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFFF8F5,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildPageHeader(),
              SizedBox(height: 32.h),
              _buildProductList()
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
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
  Widget _buildPageHeader() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sortiment',
            style: TextStyleHelper.instance.headline24BoldInter
                .copyWith(height: 1.25),
          ),
          SizedBox(height: 8.h),
          Text(
            'Verwalte die Produkte deines Sortiments.',
            style: TextStyleHelper.instance.body15RegularInter
                .copyWith(height: 1.27),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildProductList() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Consumer(
          builder: (context, ref, _) {
            final state =
                ref.watch(productAssortmentManagementNotifierProvider);

            return ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: state
                      .productAssortmentManagementModel?.productsList?.length ??
                  0,
              itemBuilder: (context, index) {
                final productModel = state
                    .productAssortmentManagementModel?.productsList?[index];
                return ProductItemWidget(
                  productItemModel: productModel,
                  onTapEdit: () {
                    onTapEditProduct(productModel?.productId ?? '');
                  },
                  onTapDelete: () {
                    onTapDeleteProduct(productModel?.productId ?? '');
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomNavBar() {
    return CustomBottomNavBar(
      bottomBarItemList: [
        CustomBottomNavItem(
          icon: ImageConstant.imgHome11,
          activeIcon: ImageConstant.imgHome11Green800,
          title: 'Start',
          routeName: AppRoutes.dashboardScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgStore01,
          activeIcon: ImageConstant.imgStore01Green800,
          title: 'Shop',
          routeName: AppRoutes.vendingMachineManagementScreen,
        ),
        CustomBottomNavItem(
          icon: ImageConstant.imgDeliverybox01Green800,
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
          icon: ImageConstant.imgUser03,
          activeIcon: ImageConstant.imgUser03Green800,
          title: 'Profil',
          routeName: AppRoutes.profileSetupScreen,
        ),
      ],
      selectedIndex: 2,
      onChanged: (index) {
        onTapBottomNavigation(index);
      },
    );
  }

  /// Navigates to customer view
  void onTapCustomerView() {
    // Handle customer view navigation
  }

  /// Handles edit product action
  void onTapEditProduct(String productId) {
    // Handle edit product action
  }

  /// Handles delete product action
  void onTapDeleteProduct(String productId) {
    ref
        .read(productAssortmentManagementNotifierProvider.notifier)
        .deleteProduct(productId);
  }

  /// Handles bottom navigation
  void onTapBottomNavigation(int index) {
    final routes = [
      AppRoutes.dashboardScreen,
      AppRoutes.vendingMachineManagementScreen,
      AppRoutes.productAssortmentManagementScreen,
      AppRoutes.salesStatisticsDashboardScreen,
      AppRoutes.profileSetupScreen,
    ];

    if (index < routes.length && index != 2) {
      NavigatorService.pushNamed(routes[index]);
    }
  }
}
