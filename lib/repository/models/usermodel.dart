import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String fullName;
  final String email;
  final String imageUrl;
  final String number;

  // Constructor
  UserModel({
    this.userId,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.number,
  });

  // custom getters to access the specific fields
  String get userName => fullName;

  String get userEmail => email;

  String get userImage => imageUrl;

  String get userNumber => number;

  // static function that return empty UserModel Constructor
  static UserModel emptyUserModel() {
    return UserModel(
      userId: "",
      fullName: "",
      email: "",
      imageUrl: "",
      number: "",
    );
  }

  // When we want to send the UserModel to Firebase FireStore
  Map<String, dynamic> toJson() {
    return {
      "uid": userId,
      "fullName": fullName,
      "email": email,
      "imageUrl": imageUrl,
      "number": number,
    };
  }

  // When we get the UserModel from Firebase FireStore
  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data()!.isNotEmpty) {
      return UserModel(
        userId: documentSnapshot["uid"],
        fullName: documentSnapshot["fullName"],
        email: documentSnapshot["email"],
        imageUrl: documentSnapshot["imageUrl"],
        number: documentSnapshot["number"],
      );
    } else {
      return UserModel.emptyUserModel();
    }
  }
}
