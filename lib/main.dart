import 'package:runstore_ecoomerce/views/catelog%20view/catalogproduct_page.dart';
import 'package:runstore_ecoomerce/views/catelog%20view/catelogpage.dart';
import 'package:runstore_ecoomerce/views/catelog%20view/shoes.dart';
import 'package:runstore_ecoomerce/views/catelog%20view/wishlist.dart';

import 'views/catelog view/womencatlog.dart';
import 'libraries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      home: ShoesPage(),
      initialBinding: AppControllersBindings(),
      debugShowCheckedModeBanner: false,
    );
  }
}
