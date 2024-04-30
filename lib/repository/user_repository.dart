import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:runstore_ecoomerce/libraries.dart';
import 'package:runstore_ecoomerce/repository/models/usermodel.dart';

class UserRepository extends GetxController {
  // Function to save user in Firebase FireStore
  Future<void> saveUserInFireStore({
    required String fullName,
    required String phoneNumber,
    required String imageUrl,
  }) async {
    print("${fullName} : ${phoneNumber} : ${imageUrl}");
    try {
      // Getting firebase's current user
      final user = FirebaseAuth.instance.currentUser;

      // Getting "users" collection reference by passing
      // userid in document ID
      final userDatabaseReference =
          FirebaseFirestore.instance.collection("users").doc(user!.uid);

      // Setting the values in model with userID
      final userData = UserModel(
        userId: user.uid,
        fullName: fullName,
        email: user.email ?? "",
        imageUrl: imageUrl,
        number: phoneNumber,
      );

      // Pass the model.toJson to store data in Firebase FireStore.
      await userDatabaseReference.set(userData.toJson());
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // Function to get the user details
  Future<UserModel> fetchUserDetails() async {
    try {
      // Getting current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // Getting user's data from the Firebase FireStore using userID
      final userProfileSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("uid", isEqualTo: userID)
          .get();

      // Passing data to factory constructor of user model
      final userProfileData = userProfileSnapshot.docs
          .map((queryDocumentSnapshot) =>
              UserModel.fromDocumentSnapshot(queryDocumentSnapshot))
          .single;

      // Returning userModel with data
      return userProfileData;
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // Function to update user's details
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      // Getting current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // updating user's data in Firebase FireStore using userID
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .update(userModel.toJson());
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // Function to update user's specific detail
  Future<void> updateUserSpecificDetail(Map<String, dynamic> json) async {
    try {
      // Getting current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // updating user's specific data in Firebase FireStore using userID
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userID)
          .update(json);
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // Function to delete user's record
  Future<void> deleteUser(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // Re authenticate the user through credential
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);

      // Getting current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // Deleting user from the Firebase authentication
      await FirebaseAuth.instance.currentUser!.delete();

      // Deleting user's record from the Firebase FireStore
      await FirebaseFirestore.instance.collection("users").doc(userID).delete();
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // Function to update user's profile picture
  Future<void> updateUserProfilePicture(String path, XFile image) async {
    try {
      // Getting current user id
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // Updating user's profile photo in the Firebase Storage
      final ref = await FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      // final downloadUrl = await ref.getDownloadURL();

      // Updating user's profilePhoto's in the Firebase FireStore
      await FirebaseFirestore.instance.collection("users").doc(userID).update(
        {"imageUrl": image.name},
      );
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }
}
