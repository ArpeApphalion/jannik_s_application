import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../product_assortment_management_screen/product_assortment_management_screen.dart';
import '../profile_setup_screen/profile_setup_screen.dart';
import '../sales_statistics_dashboard_screen/sales_statistics_dashboard_screen.dart';
import './sales_point_management_initial_page.dart';

class SalesPointManagementScreen extends ConsumerStatefulWidget {
  const SalesPointManagementScreen({Key? key}) : super(key: key);

  @override
  SalesPointManagementScreenState createState() =>
      SalesPointManagementScreenState();
}

class SalesPointManagementScreenState
    extends ConsumerState<SalesPointManagementScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.salesPointManagementScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder:
                (ctx, _, __) => // Modified: Fixed duplicate '_' parameter name
                    getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    var bottomBarItemList = [
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
        routeName: AppRoutes.salesPointManagementScreenInitialPage,
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
        icon: ImageConstant.imgUser03,
        activeIcon: ImageConstant.imgUser03Green800,
        title: 'Profil',
        routeName: AppRoutes.profileSetupScreen,
      ),
    ];

    int selectedIndex = 1;

    return CustomBottomNavBar(
      bottomBarItemList: bottomBarItemList,
      onChanged: (index) {
        selectedIndex = index;
        var bottomBarItem = bottomBarItemList[index];
        navigatorKey.currentState?.pushNamed(bottomBarItem.routeName);
      },
      selectedIndex: selectedIndex,
    );
  }

  Widget getCurrentPage(BuildContext context, String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.salesPointManagementScreenInitialPage:
        return SalesPointManagementInitialPage();
      case AppRoutes.dashboardScreen:
        return const DashboardScreen(); // Modified: Added const constructor
      case AppRoutes.productAssortmentManagementScreen:
        return ProductAssortmentManagementScreen();
      case AppRoutes.salesStatisticsDashboardScreen:
        return SalesStatisticsDashboardScreen();
      case AppRoutes.profileSetupScreen:
        return const ProfileSetupScreen(); // Modified: Added const constructor
      default:
        return Container();
    }
  }
}