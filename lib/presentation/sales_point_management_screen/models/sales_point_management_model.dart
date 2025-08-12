import '../../../core/app_export.dart';
import './location_item_model.dart';

class SalesPointManagementModel extends Equatable {
  List<LocationItemModel>? locations;

  SalesPointManagementModel({
    this.locations,
  }) {
    locations = locations ?? [];
  }

  SalesPointManagementModel copyWith({
    List<LocationItemModel>? locations,
  }) {
    return SalesPointManagementModel(
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object?> get props => [locations];
}
