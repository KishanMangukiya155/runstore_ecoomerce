class ProductModel {
  ProductModel({
    required this.product_image,
    required this.product_name,
    required this.product_brief,
    required this.product_color,
    required this.product_size,
    required this.product_price,
    this.strikePrice = 0.00,
  });

  final String product_image;
  final String product_name;
  final String product_brief;
  final String product_color;
  final String product_size;
  final double product_price;
  final double? strikePrice;
}
