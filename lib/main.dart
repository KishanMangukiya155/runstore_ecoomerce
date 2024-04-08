import 'package:runstore_ecoomerce/views/root/test_package.dart';

import 'libraries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);

    // return TestPackage();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      home: LoginScreen(),
      initialBinding: AppControllersBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
