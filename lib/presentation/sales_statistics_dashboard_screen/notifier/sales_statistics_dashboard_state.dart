part of 'sales_statistics_dashboard_notifier.dart';

class SalesStatisticsDashboardState extends Equatable {
  final SalesStatisticsDashboardModel? salesStatisticsDashboardModel;
  final String? selectedTimeFilter;
  final String? selectedSalesPoint;
  final String? selectedProduct;
  final bool isLoading;

  SalesStatisticsDashboardState({
    this.salesStatisticsDashboardModel,
    this.selectedTimeFilter,
    this.selectedSalesPoint,
    this.selectedProduct,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        salesStatisticsDashboardModel,
        selectedTimeFilter,
        selectedSalesPoint,
        selectedProduct,
        isLoading,
      ];

  SalesStatisticsDashboardState copyWith({
    SalesStatisticsDashboardModel? salesStatisticsDashboardModel,
    String? selectedTimeFilter,
    String? selectedSalesPoint,
    String? selectedProduct,
    bool? isLoading,
  }) {
    return SalesStatisticsDashboardState(
      salesStatisticsDashboardModel:
          salesStatisticsDashboardModel ?? this.salesStatisticsDashboardModel,
      selectedTimeFilter: selectedTimeFilter ?? this.selectedTimeFilter,
      selectedSalesPoint: selectedSalesPoint ?? this.selectedSalesPoint,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
