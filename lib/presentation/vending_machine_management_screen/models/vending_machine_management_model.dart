import '../../../core/app_export.dart';
import './vending_machine_item_model.dart';

class VendingMachineManagementModel extends Equatable {
  VendingMachineManagementModel({
    this.vendingMachines,
    this.id,
  }) {
    vendingMachines = vendingMachines ?? [];
    id = id ?? '';
  }

  List<VendingMachineItemModel>? vendingMachines;
  String? id;

  VendingMachineManagementModel copyWith({
    List<VendingMachineItemModel>? vendingMachines,
    String? id,
  }) {
    return VendingMachineManagementModel(
      vendingMachines: vendingMachines ?? this.vendingMachines,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [vendingMachines, id];
}
