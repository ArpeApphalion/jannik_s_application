import '../../../core/app_export.dart';
import '../models/vending_machine_item_model.dart';
import '../models/vending_machine_management_model.dart';

part 'vending_machine_management_state.dart';

final vendingMachineManagementNotifierProvider = StateNotifierProvider<
    VendingMachineManagementNotifier, VendingMachineManagementState>((ref) {
  return VendingMachineManagementNotifier(
    VendingMachineManagementState(
      vendingMachineManagementModel: VendingMachineManagementModel(),
    ),
  );
});

class VendingMachineManagementNotifier
    extends StateNotifier<VendingMachineManagementState> {
  VendingMachineManagementNotifier(VendingMachineManagementState state)
      : super(state) {
    initialize();
  }

  void initialize() {
    final vendingMachines = [
      VendingMachineItemModel(
        id: '1',
        name: 'Automat Marktstraße',
        type: 'Automat',
        status: 'Aktiv',
        statusColor: appTheme.colorFFE2F7,
        statusTextColor: appTheme.colorFF3478,
        location: 'Marktstraße 12, 12345 Musterstadt',
        operatingHours: 'Täglich 7-22 Uhr',
        imagePath: ImageConstant.imgPlaceholder,
        isActive: true,
      ),
      VendingMachineItemModel(
        id: '2',
        name: 'Automat Dorfplatz',
        type: 'Automat',
        status: 'Inaktiv',
        statusColor: appTheme.colorFFF6F7,
        statusTextColor: appTheme.colorFF8B7E,
        location: 'Dorfplatz 9, 12345 Musterstadt',
        operatingHours: 'Täglich 6-20 Uhr',
        imagePath: ImageConstant.imgPlaceholder,
        isActive: false,
      ),
    ];

    state = state.copyWith(
      vendingMachineManagementModel:
          state.vendingMachineManagementModel?.copyWith(
        vendingMachines: vendingMachines,
      ),
      selectedFilter: 'automaten',
      isLoading: false,
    );
  }

  void selectFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }

  List<VendingMachineItemModel> get filteredVendingMachines {
    final machines = state.vendingMachineManagementModel?.vendingMachines ?? [];

    switch (state.selectedFilter) {
      case 'alle':
        return machines;
      case 'automaten':
        return machines.where((machine) => machine.type == 'Automat').toList();
      case 'hoflaeden':
        return machines.where((machine) => machine.type == 'Hofladen').toList();
      default:
        return machines;
    }
  }
}
