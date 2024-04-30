import 'package:runstore_ecoomerce/libraries.dart';

class ShoppingCartModel {
  ProductModel productModel;
  int quantity;

  ShoppingCartModel({
    required this.productModel,
    required this.quantity,
  });

  // final String category_name;
  // final String product_image;
  // final String product_name;
  // final String product_brief;
  // final String product_color;
  // final String product_size;
  // final double product_price;
  // final double? strikePrice;
  // final bool isFavorite;
  // int quantity;
  //
  // ShoppingCartModel({
  //   required this.category_name,
  //   required this.product_image,
  //   required this.product_name,
  //   required this.product_brief,
  //   required this.product_color,
  //   required this.product_size,
  //   required this.product_price,
  //   required this.strikePrice,
  //   required this.isFavorite,
  //   this.quantity = 1,
  // });
  //
  // ShoppingCartModel.empty({
  //   this.category_name = "",
  //   this.product_image = "",
  //   this.product_name = "",
  //   this.product_brief = "",
  //   this.product_color = "",
  //   this.product_size = "",
  //   this.product_price = 0.0,
  //   this.strikePrice,
  //   this.isFavorite = false,
  //   this.quantity = 0,
  // });
}
