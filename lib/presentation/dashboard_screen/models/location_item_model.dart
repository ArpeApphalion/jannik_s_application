import '../../../core/app_export.dart';
import '../widgets/location_card_widget.dart';

/// This class is used in the [LocationCardWidget] widget.

// ignore_for_file: must_be_immutable
class LocationItemModel extends Equatable {
  LocationItemModel({
    this.id,
    this.name,
    this.type,
    this.isActive,
    this.imagePath,
  }) {
    id = id ?? '';
    name = name ?? '';
    type = type ?? '';
    isActive = isActive ?? false;
    imagePath = imagePath ?? '';
  }

  String? id;
  String? name;
  String? type;
  bool? isActive;
  String? imagePath;

  LocationItemModel copyWith({
    String? id,
    String? name,
    String? type,
    bool? isActive,
    String? imagePath,
  }) {
    return LocationItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      isActive: isActive ?? this.isActive,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [id, name, type, isActive, imagePath];
}
