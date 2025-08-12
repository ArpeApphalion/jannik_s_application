import '../../../core/app_export.dart';
import './location_item_model.dart';

/// This class is used in the [DashboardScreen] screen.

// ignore_for_file: must_be_immutable
class DashboardModel extends Equatable {
  DashboardModel({
    this.userName,
    this.automatenList,
    this.hofladenList,
    this.id,
  }) {
    userName = userName ?? '[Name]';
    automatenList = automatenList ?? [];
    hofladenList = hofladenList ?? [];
    id = id ?? '';
  }

  String? userName;
  List<LocationItemModel>? automatenList;
  List<LocationItemModel>? hofladenList;
  String? id;

  DashboardModel copyWith({
    String? userName,
    List<LocationItemModel>? automatenList,
    List<LocationItemModel>? hofladenList,
    String? id,
  }) {
    return DashboardModel(
      userName: userName ?? this.userName,
      automatenList: automatenList ?? this.automatenList,
      hofladenList: hofladenList ?? this.hofladenList,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [userName, automatenList, hofladenList, id];
}
