import '../../../core/app_export.dart';
import '../models/sales_statistics_dashboard_model.dart';
import '../models/statistics_card_model.dart';

part 'sales_statistics_dashboard_state.dart';

final salesStatisticsDashboardNotifier = StateNotifierProvider.autoDispose<
    SalesStatisticsDashboardNotifier, SalesStatisticsDashboardState>(
  (ref) => SalesStatisticsDashboardNotifier(
    SalesStatisticsDashboardState(
      salesStatisticsDashboardModel: SalesStatisticsDashboardModel(),
    ),
  ),
);

class SalesStatisticsDashboardNotifier
    extends StateNotifier<SalesStatisticsDashboardState> {
  SalesStatisticsDashboardNotifier(SalesStatisticsDashboardState state)
      : super(state) {
    initialize();
  }

  void initialize() {
    final statisticsCards = [
      StatisticsCardModel(
        title: 'Umsatz gesamt',
        value: '1.590,00',
        iconPath: ImageConstant.imgFrameBlueGray60018x11,
      ),
      StatisticsCardModel(
        title: 'Verkäufe',
        value: '259',
        iconPath: ImageConstant.imgFrameGreen80018x13,
      ),
      StatisticsCardModel(
        title: 'Ø Bon',
        value: '6,14',
        iconPath: ImageConstant.imgFrameGreen600,
      ),
      StatisticsCardModel(
        title: 'Top Produkt',
        value: 'Eier 10er',
        iconPath: ImageConstant.imgFrameBlueGray60018x20,
      ),
    ];

    state = state.copyWith(
      salesStatisticsDashboardModel:
          state.salesStatisticsDashboardModel?.copyWith(
        statisticsCards: statisticsCards,
      ),
      selectedTimeFilter: 'zeitraum',
      selectedSalesPoint: 'verkaufspunkt',
      selectedProduct: 'produkt',
    );
  }

  void updateTimeFilter(String? value) {
    state = state.copyWith(
      selectedTimeFilter: value,
    );
  }

  void updateSalesPointFilter(String? value) {
    state = state.copyWith(
      selectedSalesPoint: value,
    );
  }

  void updateProductFilter(String? value) {
    state = state.copyWith(
      selectedProduct: value,
    );
  }
}
