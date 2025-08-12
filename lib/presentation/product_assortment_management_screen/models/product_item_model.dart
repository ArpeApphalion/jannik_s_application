import '../../../core/app_export.dart';

class ProductItemModel extends Equatable {
  ProductItemModel({
    this.productId,
    this.productName,
    this.price,
    this.imagePlaceholder,
  }) {
    productId = productId ?? '';
    productName = productName ?? '';
    price = price ?? '';
    imagePlaceholder = imagePlaceholder ?? 'IMG\n56×56';
  }

  String? productId;
  String? productName;
  String? price;
  String? imagePlaceholder;

  ProductItemModel copyWith({
    String? productId,
    String? productName,
    String? price,
    String? imagePlaceholder,
  }) {
    return ProductItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      imagePlaceholder: imagePlaceholder ?? this.imagePlaceholder,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        productName,
        price,
        imagePlaceholder,
      ];
}
