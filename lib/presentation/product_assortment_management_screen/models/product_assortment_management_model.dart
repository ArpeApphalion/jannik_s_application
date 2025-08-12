import '../../../core/app_export.dart';
import './product_item_model.dart';

class ProductAssortmentManagementModel extends Equatable {
  ProductAssortmentManagementModel({
    this.productsList,
  }) {
    productsList = productsList ?? [];
  }

  List<ProductItemModel>? productsList;

  ProductAssortmentManagementModel copyWith({
    List<ProductItemModel>? productsList,
  }) {
    return ProductAssortmentManagementModel(
      productsList: productsList ?? this.productsList,
    );
  }

  @override
  List<Object?> get props => [productsList];
}
