import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class VendingMachineItemModel extends Equatable {
  VendingMachineItemModel({
    this.id,
    this.name,
    this.type,
    this.status,
    this.statusColor,
    this.statusTextColor,
    this.location,
    this.operatingHours,
    this.imagePath,
    this.isActive,
  }) {
    id = id ?? '';
    name = name ?? '';
    type = type ?? '';
    status = status ?? '';
    statusColor = statusColor ?? Color(0xFFE2F7E1);
    statusTextColor = statusTextColor ?? Color(0xFF34784F);
    location = location ?? '';
    operatingHours = operatingHours ?? '';
    imagePath = imagePath ?? '';
    isActive = isActive ?? true;
  }

  String? id;
  String? name;
  String? type;
  String? status;
  Color? statusColor;
  Color? statusTextColor;
  String? location;
  String? operatingHours;
  String? imagePath;
  bool? isActive;

  VendingMachineItemModel copyWith({
    String? id,
    String? name,
    String? type,
    String? status,
    Color? statusColor,
    Color? statusTextColor,
    String? location,
    String? operatingHours,
    String? imagePath,
    bool? isActive,
  }) {
    return VendingMachineItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      statusColor: statusColor ?? this.statusColor,
      statusTextColor: statusTextColor ?? this.statusTextColor,
      location: location ?? this.location,
      operatingHours: operatingHours ?? this.operatingHours,
      imagePath: imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        status,
        statusColor,
        statusTextColor,
        location,
        operatingHours,
        imagePath,
        isActive,
      ];
}
