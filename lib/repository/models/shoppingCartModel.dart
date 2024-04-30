import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCartModel {
  final String? userId;
  final String shopping_cart_id;
  final String shopping_cart_list;

  // Constructor
  ShoppingCartModel({
    this.userId,
    required this.shopping_cart_id,
    required this.shopping_cart_list,
  });

  // static function that return empty UserModel Constructor
  static ShoppingCartModel emptyUserModel() {
    return ShoppingCartModel(
      userId: "",
      shopping_cart_id: "",
      shopping_cart_list: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "uid": userId,
      "shopping_cart_id": shopping_cart_id,
      "shopping_cart_list": shopping_cart_list,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory ShoppingCartModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return ShoppingCartModel(
        userId: documentSnapshot["uid"],
        shopping_cart_id: documentSnapshot["shopping_cart_id"],
        shopping_cart_list: documentSnapshot["shopping_cart_list"],
      );
    } else {
      return ShoppingCartModel.emptyUserModel();
    }
  }
}
