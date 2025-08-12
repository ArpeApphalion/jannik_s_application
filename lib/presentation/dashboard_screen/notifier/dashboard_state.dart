part of 'dashboard_notifier.dart';

class DashboardState extends Equatable {
  final DashboardModel? dashboardModel;
  final bool isLoading;

  const DashboardState({
    this.dashboardModel,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        dashboardModel,
        isLoading,
      ];

  DashboardState copyWith({
    DashboardModel? dashboardModel,
    bool? isLoading,
  }) {
    return DashboardState(
      dashboardModel: dashboardModel ?? this.dashboardModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
