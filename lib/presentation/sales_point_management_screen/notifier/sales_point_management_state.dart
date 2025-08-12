part of 'sales_point_management_notifier.dart';

class SalesPointManagementState extends Equatable {
  final SalesPointManagementModel? salesPointManagementModel;
  final String selectedFilter;
  final bool isLoading;

  const SalesPointManagementState({
    this.salesPointManagementModel,
    this.selectedFilter = 'alle',
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        salesPointManagementModel,
        selectedFilter,
        isLoading,
      ];

  SalesPointManagementState copyWith({
    SalesPointManagementModel? salesPointManagementModel,
    String? selectedFilter,
    bool? isLoading,
  }) {
    return SalesPointManagementState(
      salesPointManagementModel:
          salesPointManagementModel ?? this.salesPointManagementModel,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  List<LocationItemModel> getFilteredLocations() {
    final locations = salesPointManagementModel?.locations ?? [];

    switch (selectedFilter) {
      case 'automaten':
        return locations
            .where((location) => location.type == 'Automat')
            .toList();
      case 'hoflaeden':
        return locations
            .where((location) => location.type == 'Hofladen')
            .toList();
      default:
        return locations;
    }
  }
}
