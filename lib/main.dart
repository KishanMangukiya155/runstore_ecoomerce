import 'package:firebase_app_check/firebase_app_check.dart';

import 'libraries.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final authController = Get.put(AuthController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      initialBinding: AppControllersBindings(),
      home: authController.screenRedirect(),
      debugShowCheckedModeBanner: false,
    );
  }
}
