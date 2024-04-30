import 'package:google_sign_in/google_sign_in.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class AuthRepository extends GetxController {
  // Create instances of firebaseAuth
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // A function to create user with email and password
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // A function to sign in user with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // A function to sign in user with their Google account
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      // Sending password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on AppFirebaseException catch (e) {
      throw AppFirebaseException(error: e.error).getMessageFromErrorCode();
    } catch (e) {
      throw e;
    }
  }

  // A function to signOut user
  Future<void> signOutUser() async {
    try {
      await firebaseAuth.signOut();
      CustomSnackBars.appSnackBar(message: "Thank you for visit RunStore");
    } catch (e) {
      print(e);
    } finally {
      print("Function complete");
    }
  }
}
