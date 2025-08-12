part of 'vending_machine_management_notifier.dart';

class VendingMachineManagementState extends Equatable {
  final VendingMachineManagementModel? vendingMachineManagementModel;
  final String selectedFilter;
  final bool isLoading;
  final List<VendingMachineItemModel>? filteredVendingMachines;

  VendingMachineManagementState({
    this.vendingMachineManagementModel,
    this.selectedFilter = 'automaten',
    this.isLoading = false,
    this.filteredVendingMachines,
  });

  @override
  List<Object?> get props => [
        vendingMachineManagementModel,
        selectedFilter,
        isLoading,
        filteredVendingMachines,
      ];

  VendingMachineManagementState copyWith({
    VendingMachineManagementModel? vendingMachineManagementModel,
    String? selectedFilter,
    bool? isLoading,
    List<VendingMachineItemModel>? filteredVendingMachines,
  }) {
    return VendingMachineManagementState(
      vendingMachineManagementModel:
          vendingMachineManagementModel ?? this.vendingMachineManagementModel,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      isLoading: isLoading ?? this.isLoading,
      filteredVendingMachines:
          filteredVendingMachines ?? this.filteredVendingMachines,
    );
  }
}
