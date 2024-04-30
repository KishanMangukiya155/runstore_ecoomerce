import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class ProfileController extends GetxController {
  List<UserAddressModel> myAddresses = [
    UserAddressModel(
      home: "My Home #1",
      address: "438, Dark Spurt Avenue,",
      city: "San Fransisco, ",
      state: "California, ",
      zipCode: "94528",
    ),
    UserAddressModel(
      home: "My Home #2",
      address: "439, Dark Spurt Avenue,",
      city: "San Fransisco, ",
      state: "California, ",
      zipCode: "94528",
    ),
    UserAddressModel(
      home: "My Home #3",
      address: "440, Dark Spurt Avenue,",
      city: "San Fransisco, ",
      state: "California, ",
      zipCode: "94528",
    ),
  ];

  // Controllers that are used to set the address
  final homeTextController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipcodeController = TextEditingController();
  final stateController = TextEditingController();

  // Controllers that are used to update the userProfile
  final updateFullNameController = TextEditingController();
  final updateEmailController = TextEditingController();
  final updatePhoneNumberController = TextEditingController();

  // Controllers that are used in re authenticate the user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obscureText = false.obs;
  final reAuthenticateFormKey = GlobalKey<FormState>();

  RxInt myAddressesIndex = 0.obs;
  RxBool setDefaultAddress = true.obs;

  changeUserAddress(int index) {
    homeTextController.text = myAddresses[index].home;
    addressController.text = myAddresses[index].address;
    cityController.text = myAddresses[index].city;
    zipcodeController.text = myAddresses[index].zipCode;
    stateController.text = myAddresses[index].state;
    update();
  }

  Future<void> deleteUser(String email, String password) async {
    try {
      // Form validations
      if (!reAuthenticateFormKey.currentState!.validate()) return;

      // Deleting user
      await UserRepository().deleteUser(email, password);

      Get.offAll(() => LoginScreen());
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }

  Future<void> updateUserProfilePictureFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 70);
      if (image != null) {
        // updating user's profile picture
        await UserRepository()
            .updateUserProfilePicture("users/images/profile", image);
      }
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }

  Future<void> updateUserProfilePictureFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 70);
      if (image != null) {
        // updating user's profile picture
        await UserRepository()
            .updateUserProfilePicture("users/images/profile", image);
      }
    } catch (e) {
      CustomSnackBars.errorSnackBar(message: e.toString());
    }
  }
}
