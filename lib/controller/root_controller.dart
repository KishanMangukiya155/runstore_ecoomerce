import 'package:runstore_ecoomerce/libraries.dart';

class RootController extends GetxController {
  RxInt navigationIndex = 0.obs;

  List<Map<String, dynamic>> navigationList = [
    {
      "page": Center(child: Text("Home Page")),
      "iconData": PhosphorIcons.house,
      "fillIconData": PhosphorIcons.house_fill,
    },
    {
      "page": Center(child: Text("category page")),
      "iconData": PhosphorIcons.notebook,
      "fillIconData": PhosphorIcons.notebook_fill,
    },
    {
      "page": Center(child: Text("Cart page")),
      "iconData": PhosphorIcons.shopping_cart,
      "fillIconData": PhosphorIcons.shopping_cart_fill,
    },
    {
      "page": Center(child: Text("Favorites page")),
      "iconData": PhosphorIcons.heart,
      "fillIconData": PhosphorIcons.heart_fill,
    },
    {
      "page": ProfileScreen(),
      "iconData": Icons.person_outline,
      "fillIconData": Icons.person,
    },
  ];

  void setNavigationIndex(int value) {
    navigationIndex(value);
  }
}
