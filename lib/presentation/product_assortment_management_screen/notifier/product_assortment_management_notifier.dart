import '../models/product_assortment_management_model.dart';
import '../models/product_item_model.dart';
import '../../../core/app_export.dart';

part 'product_assortment_management_state.dart';

final productAssortmentManagementNotifierProvider =
    StateNotifierProvider.autoDispose<ProductAssortmentManagementNotifier,
        ProductAssortmentManagementState>(
  (ref) => ProductAssortmentManagementNotifier(
    ProductAssortmentManagementState(
      productAssortmentManagementModel: ProductAssortmentManagementModel(),
    ),
  ),
);

class ProductAssortmentManagementNotifier
    extends StateNotifier<ProductAssortmentManagementState> {
  ProductAssortmentManagementNotifier(ProductAssortmentManagementState state)
      : super(state) {
    initialize();
  }

  void initialize() {
    final products = [
      ProductItemModel(
        productId: 'marmelade',
        productName: 'Hausgemachte Marmelade',
        price: '3,90 €',
        imagePlaceholder: 'IMG\n56×56',
      ),
      ProductItemModel(
        productId: 'eier',
        productName: 'Frische Eier (6er Pack)',
        price: '2,40 €',
        imagePlaceholder: 'IMG\n56×56',
      ),
      ProductItemModel(
        productId: 'bauernbrot',
        productName: 'Bauernbrot (500g)',
        price: '4,20 €',
        imagePlaceholder: 'IMG\n56×56',
      ),
    ];

    state = state.copyWith(
      productAssortmentManagementModel:
          state.productAssortmentManagementModel?.copyWith(
        productsList: products,
      ),
    );
  }

  void deleteProduct(String productId) {
    final currentProducts =
        state.productAssortmentManagementModel?.productsList ?? [];
    final updatedProducts = currentProducts
        .where((product) => product.productId != productId)
        .toList();

    state = state.copyWith(
      productAssortmentManagementModel:
          state.productAssortmentManagementModel?.copyWith(
        productsList: updatedProducts,
      ),
    );
  }
}
