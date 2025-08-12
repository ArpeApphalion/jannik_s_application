import '../../../core/app_export.dart';
import './statistics_card_model.dart';

class SalesStatisticsDashboardModel extends Equatable {
  List<StatisticsCardModel>? statisticsCards;

  SalesStatisticsDashboardModel({
    this.statisticsCards,
  }) {
    statisticsCards = statisticsCards ?? [];
  }

  @override
  List<Object?> get props => [statisticsCards];

  SalesStatisticsDashboardModel copyWith({
    List<StatisticsCardModel>? statisticsCards,
  }) {
    return SalesStatisticsDashboardModel(
      statisticsCards: statisticsCards ?? this.statisticsCards,
    );
  }
}
