import 'package:get_storage/get_storage.dart';

import 'libraries.dart';

void main() async {
  WidgetsFlutterBinding.
  ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final get = GetStorage();

    print("${get.read("email")} ${get.read("password")}");

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      initialBinding: AppControllersBindings(),
      home: get.read("rememberMe") ?? false ? RootScreen() : LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
