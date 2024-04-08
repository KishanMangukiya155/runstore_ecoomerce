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

  final homeTextController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipcodeController = TextEditingController();
  final stateController = TextEditingController();

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
}
