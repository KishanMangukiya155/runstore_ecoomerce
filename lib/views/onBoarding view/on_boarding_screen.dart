import 'dart:async';

import 'package:runstore_ecoomerce/libraries.dart';

class BoardingScreen extends StatelessWidget {
  BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(() => LoginScreen()),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
