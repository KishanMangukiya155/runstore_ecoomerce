import 'package:cloud_firestore/cloud_firestore.dart';

class WishListModel {
  final String? userId;
  final String wishlist_id;
  final String wishlist;

  // Constructor
  WishListModel({
    this.userId,
    required this.wishlist_id,
    required this.wishlist,
  });

  // static function that return empty UserModel Constructor
  static WishListModel emptyUserModel() {
    return WishListModel(
      userId: "",
      wishlist_id: "",
      wishlist: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "uid": userId,
      "wishlist_id": wishlist_id,
      "wishlist": wishlist,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory WishListModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return WishListModel(
        userId: documentSnapshot["uid"],
        wishlist_id: documentSnapshot["wishlist_id"],
        wishlist: documentSnapshot["wishlist"],
      );
    } else {
      return WishListModel.emptyUserModel();
    }
  }
}
