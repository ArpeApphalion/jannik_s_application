import '../../../core/app_export.dart';

class StatisticsCardModel extends Equatable {
  String? title;
  String? value;
  String? iconPath;

  StatisticsCardModel({
    this.title,
    this.value,
    this.iconPath,
  }) {
    title = title ?? '';
    value = value ?? '';
    iconPath = iconPath ?? '';
  }

  @override
  List<Object?> get props => [title, value, iconPath];

  StatisticsCardModel copyWith({
    String? title,
    String? value,
    String? iconPath,
  }) {
    return StatisticsCardModel(
      title: title ?? this.title,
      value: value ?? this.value,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}
