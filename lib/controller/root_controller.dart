import 'package:runstore_ecoomerce/libraries.dart';
import 'package:runstore_ecoomerce/views/wishlist%20view/wishlist_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootController extends GetxController {
  RxInt navigationIndex = 0.obs;

  // This list display the page/widget
  // according to the navigationIndex.......
  List<Widget> navigationWidget = [
    HomeScreen(),
    CatalogScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen(),
  ];

  // This list display the navigation icons and labels.......
  List<Map<String, dynamic>> simpleNavigationList = [
    // SalomonBottomBarItem
    // {
    //   "active": SalomonBottomBarItem(
    //     icon: Icon(Icons.home),
    //     title: Text("Home"),
    //     selectedColor: Colors.purple,
    //   ),
    //   "unActive": SalomonBottomBarItem(
    //     icon: Icon(Icons.home),
    //     title: Text(""),
    //     selectedColor: Colors.black54,
    //   ),
    // },
    // {
    //   "active": SalomonBottomBarItem(
    //     icon: Icon(Icons.favorite_border),
    //     title: Text("Home"),
    //     selectedColor: Colors.purple,
    //   ),
    //   "unActive": SalomonBottomBarItem(
    //     icon: Icon(Icons.home),
    //     title: Text(""),
    //     selectedColor: Colors.black54,
    //   ),
    // },
    // {
    //   "active": SalomonBottomBarItem(
    //     icon: Icon(Icons.search),
    //     title: Text("Home"),
    //     selectedColor: Colors.purple,
    //   ),
    //   "unActive": SalomonBottomBarItem(
    //     icon: Icon(Icons.home),
    //     title: Text(""),
    //     selectedColor: Colors.black54,
    //   ),
    // },
    // {
    //   "active": SalomonBottomBarItem(
    //     icon: Icon(Icons.person),
    //     title: Text("Home"),
    //     selectedColor: Colors.purple,
    //   ),
    //   "unActive": SalomonBottomBarItem(
    //     icon: Icon(Icons.home),
    //     title: Text(""),
    //     selectedColor: Colors.black54,
    //   ),
    // },

    // Custom
    // {
    //   "selected": PhosphorIcons.house_line_fill,
    //   "unSelected": PhosphorIcons.house_line_light,
    //   "text": "data",
    // },
    // {
    //   "selected": Icons.list_alt,
    //   "unSelected": Icons.list_alt,
    //   "text": "data",
    // },
    // {
    //   "selected": PhosphorIcons.storefront_fill,
    //   "unSelected": PhosphorIcons.storefront_light,
    //   "text": "data",
    // },
    // {
    //   "selected": PhosphorIcons.heart_straight_fill,
    //   "unSelected": PhosphorIcons.heart_light,
    //   "text": "data",
    // },
    // {
    //   "selected": PhosphorIcons.user_circle_fill,
    //   "unSelected": PhosphorIcons.user_circle_light,
    //   "text": "data",
    // },
  ];

  void setNavigationIndex(int value) {
    navigationIndex(value);
  }
}
