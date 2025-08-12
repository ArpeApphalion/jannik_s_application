import '../../../core/app_export.dart';
import '../models/dashboard_model.dart';
import '../models/location_item_model.dart';

part 'dashboard_state.dart';

final dashboardNotifierProvider =
    StateNotifierProvider.autoDispose<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(
    DashboardState(
      dashboardModel: DashboardModel(),
    ),
  ),
);

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier(DashboardState state) : super(state) {
    initialize();
  }

  void initialize() {
    final automatenList = [
      LocationItemModel(
        id: 'automat-marktstrasse',
        name: 'Automat Marktstraße',
        type: 'Automat',
        isActive: true,
        imagePath: ImageConstant.imgPlaceholder,
      ),
      LocationItemModel(
        id: 'automat-dorfplatz',
        name: 'Automat Dorfplatz',
        type: 'Automat',
        isActive: false,
        imagePath: ImageConstant.imgPlaceholder,
      ),
    ];

    final hofladenList = [
      LocationItemModel(
        id: 'hofladen-moeller',
        name: 'Hofladen Möller',
        type: 'Hofladen',
        isActive: true,
        imagePath: ImageConstant.imgPlaceholder,
      ),
      LocationItemModel(
        id: 'hofladen-schuster',
        name: 'Hofladen Schuster',
        type: 'Hofladen',
        isActive: false,
        imagePath: ImageConstant.imgPlaceholder,
      ),
    ];

    state = state.copyWith(
      dashboardModel: DashboardModel(
        userName: '[Name]',
        automatenList: automatenList,
        hofladenList: hofladenList,
      ),
    );
  }

  void updateUserName(String userName) {
    state = state.copyWith(
      dashboardModel: state.dashboardModel?.copyWith(userName: userName),
    );
  }

  void toggleLocationStatus(String locationId) {
    final updatedAutomatenList =
        state.dashboardModel?.automatenList?.map((location) {
      if (location.id == locationId) {
        return location.copyWith(isActive: !(location.isActive ?? false));
      }
      return location;
    }).toList();

    final updatedHofladenList =
        state.dashboardModel?.hofladenList?.map((location) {
      if (location.id == locationId) {
        return location.copyWith(isActive: !(location.isActive ?? false));
      }
      return location;
    }).toList();

    state = state.copyWith(
      dashboardModel: state.dashboardModel?.copyWith(
        automatenList: updatedAutomatenList,
        hofladenList: updatedHofladenList,
      ),
    );
  }
}
