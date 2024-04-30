import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final String? category_id;
  final String product_id;
  final String brand_id;
  final String product_name;
  final String product_description;
  final String product_image;
  final String product_price;

  // Constructor
  ProductsModel({
    this.category_id,
    required this.product_id,
    required this.brand_id,
    required this.product_name,
    required this.product_description,
    required this.product_image,
    required this.product_price,
  });

  // static function that return empty UserModel Constructor
  static ProductsModel emptyUserModel() {
    return ProductsModel(
      category_id: "",
      product_id: "",
      brand_id: "",
      product_name: "",
      product_description: "",
      product_image: "",
      product_price: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "category_id": category_id,
      "product_id": product_id,
      "brand_id": brand_id,
      "product_name": product_name,
      "product_description": product_description,
      "product_image": product_image,
      "product_price": product_price,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory ProductsModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return ProductsModel(
        category_id: documentSnapshot["category_id"],
        product_id: documentSnapshot["product_id"],
        brand_id: documentSnapshot["brand_id"],
        product_name: documentSnapshot["product_name"],
        product_description: documentSnapshot["product_description"],
        product_image: documentSnapshot['product_image'],
        product_price: documentSnapshot['product_price'],
      );
    } else {
      return ProductsModel.emptyUserModel();
    }
  }
}
