import 'package:flutter/material.dart';
import '../presentation/sales_statistics_dashboard_screen/sales_statistics_dashboard_screen.dart';
import '../presentation/sales_point_management_screen/sales_point_management_screen.dart';
import '../presentation/profile_setup_screen/profile_setup_screen.dart';
import '../presentation/dashboard_screen/dashboard_screen.dart';
import '../presentation/vending_machine_management_screen/vending_machine_management_screen.dart';
import '../presentation/product_assortment_management_screen/product_assortment_management_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String salesStatisticsDashboardScreen =
      '/sales_statistics_dashboard_screen';
  static const String salesPointManagementScreen =
      '/sales_point_management_screen';
  static const String salesPointManagementScreenInitialPage =
      '/sales_point_management_screen_initial_page';
  static const String profileSetupScreen = '/profile_setup_screen';
  static const String dashboardScreen = '/dashboard_screen';
  static const String vendingMachineManagementScreen =
      '/vending_machine_management_screen';
  static const String productAssortmentManagementScreen =
      '/product_assortment_management_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        salesStatisticsDashboardScreen: (context) =>
            SalesStatisticsDashboardScreen(),
        salesPointManagementScreen: (context) => SalesPointManagementScreen(),
        profileSetupScreen: (context) => ProfileSetupScreen(),
        dashboardScreen: (context) => DashboardScreen(),
        vendingMachineManagementScreen: (context) =>
            VendingMachineManagementScreen(),
        productAssortmentManagementScreen: (context) =>
            ProductAssortmentManagementScreen(),
        appNavigationScreen: (context) => AppNavigationScreen(),
        initialRoute: (context) => AppNavigationScreen()
      };
}
