import 'package:cloud_firestore/cloud_firestore.dart';

class BrandsModel {
  final String? category_id;
  final String brands_id;
  final String brands_name;

  // Constructor
  BrandsModel({
    this.category_id,
    required this.brands_id,
    required this.brands_name,
  });

  // static function that return empty UserModel Constructor
  static BrandsModel emptyUserModel() {
    return BrandsModel(
      category_id: "",
      brands_id: "",
      brands_name: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "category_id": category_id,
      "brands_id": brands_id,
      "brands_name": brands_name,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory BrandsModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return BrandsModel(
        category_id: documentSnapshot["category_id"],
        brands_id: documentSnapshot["brands_id"],
        brands_name: documentSnapshot["brands_name"],
      );
    } else {
      return BrandsModel.emptyUserModel();
    }
  }
}
