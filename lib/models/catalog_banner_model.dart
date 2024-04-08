import 'package:runstore_ecoomerce/libraries.dart';

class CatalogBannerModel {
  CatalogBannerModel({
    required this.bgColor,
    required this.image,
    required this.customerType,
    required this.customerTypeTextColor,
    required this.totalProducts,
    required this.buttonColor,
  });

  final Color bgColor;
  final String image;
  final String? customerType;
  final Color? customerTypeTextColor;
  final double? totalProducts;
  final Color buttonColor;
}
