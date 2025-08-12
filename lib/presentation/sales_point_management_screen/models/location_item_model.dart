import '../../../core/app_export.dart';

class LocationItemModel extends Equatable {
  String? id;
  String? name;
  String? type;
  String? status;
  String? address;
  String? hours;
  bool? isActive;
  String? image;

  LocationItemModel({
    this.id,
    this.name,
    this.type,
    this.status,
    this.address,
    this.hours,
    this.isActive,
    this.image,
  }) {
    id = id ?? '';
    name = name ?? '';
    type = type ?? '';
    status = status ?? '';
    address = address ?? '';
    hours = hours ?? '';
    isActive = isActive ?? false;
    image = image ?? 'IMG\n56×56';
  }

  LocationItemModel copyWith({
    String? id,
    String? name,
    String? type,
    String? status,
    String? address,
    String? hours,
    bool? isActive,
    String? image,
  }) {
    return LocationItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      address: address ?? this.address,
      hours: hours ?? this.hours,
      isActive: isActive ?? this.isActive,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        status,
        address,
        hours,
        isActive,
        image,
      ];
}
