import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String? category_id;
  final String category_name;

  // Constructor
  ProductCategoryModel({
    this.category_id,
    required this.category_name,
  });

  // static function that return empty UserModel Constructor
  static ProductCategoryModel emptyUserModel() {
    return ProductCategoryModel(
      category_id: "",
      category_name: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "category_id": category_id,
      "category_name": category_name,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory ProductCategoryModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return ProductCategoryModel(
        category_id: documentSnapshot["category_id"],
        category_name: documentSnapshot["category_name"],
      );
    } else {
      return ProductCategoryModel.emptyUserModel();
    }
  }
}
