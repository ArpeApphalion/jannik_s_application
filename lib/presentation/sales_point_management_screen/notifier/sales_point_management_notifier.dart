import '../models/sales_point_management_model.dart';
import '../models/location_item_model.dart';
import '../../../core/app_export.dart';

part 'sales_point_management_state.dart';

final salesPointManagementNotifier = StateNotifierProvider.autoDispose<
    SalesPointManagementNotifier, SalesPointManagementState>(
  (ref) => SalesPointManagementNotifier(
    SalesPointManagementState(
      salesPointManagementModel: SalesPointManagementModel(),
    ),
  ),
);

class SalesPointManagementNotifier
    extends StateNotifier<SalesPointManagementState> {
  SalesPointManagementNotifier(SalesPointManagementState state) : super(state) {
    initialize();
  }

  void initialize() {
    final locations = [
      LocationItemModel(
        id: 'automat-marktstrasse',
        name: 'Automat Marktstraße',
        type: 'Automat',
        status: 'Aktiv',
        address: 'Marktstraße 12, 12345 Musterstadt',
        hours: 'Täglich 7-22 Uhr',
        isActive: true,
        image: 'IMG\n56×56',
      ),
      LocationItemModel(
        id: 'automat-dorfplatz',
        name: 'Automat Dorfplatz',
        type: 'Automat',
        status: 'Inaktiv',
        address: 'Dorfplatz 9, 12345 Musterstadt',
        hours: 'Täglich 6-20 Uhr',
        isActive: false,
        image: 'IMG\n56×56',
      ),
      LocationItemModel(
        id: 'hofladen-moeller',
        name: 'Hofladen Möller',
        type: 'Hofladen',
        status: 'Aktiv',
        address: 'Lindenweg 5, 12345 Musterstadt',
        hours: 'Mo–Sa 8–18 Uhr',
        isActive: true,
        image: 'IMG\n56×56',
      ),
      LocationItemModel(
        id: 'hofladen-schuster',
        name: 'Hofladen Schuster',
        type: 'Hofladen',
        status: 'Inaktiv',
        address: 'Hauptstraße 99, 12345 Musterstadt',
        hours: 'Mo–Fr 9–17 Uhr',
        isActive: false,
        image: 'IMG\n56×56',
      ),
    ];

    state = state.copyWith(
      salesPointManagementModel: state.salesPointManagementModel?.copyWith(
        locations: locations,
      ),
      selectedFilter: 'alle',
    );
  }

  void updateFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}
