part of 'product_assortment_management_notifier.dart';

class ProductAssortmentManagementState extends Equatable {
  final ProductAssortmentManagementModel? productAssortmentManagementModel;
  final bool isLoading;

  ProductAssortmentManagementState({
    this.productAssortmentManagementModel,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
        productAssortmentManagementModel,
        isLoading,
      ];

  ProductAssortmentManagementState copyWith({
    ProductAssortmentManagementModel? productAssortmentManagementModel,
    bool? isLoading,
  }) {
    return ProductAssortmentManagementState(
      productAssortmentManagementModel: productAssortmentManagementModel ??
          this.productAssortmentManagementModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
