import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class TestPackage extends StatelessWidget {
  static final title = 'salomon_bottom_bar';

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final rootController = Get.find<RootController>();
    return SalomonBottomBar(
      currentIndex: rootController.navigationIndex.value,
      onTap: (index) {
        rootController.setNavigationIndex(index);
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          activeIcon: Icon(PhosphorIcons.house_line_fill),
          icon: Icon(PhosphorIcons.house_line),
          title: Text("Home"),
          selectedColor: primaryColor,
        ),

        /// Catalog
        SalomonBottomBarItem(
          activeIcon: Icon(Icons.list_alt),
          icon: Icon(Icons.list_alt_outlined),
          title: Text("Catalog"),
          selectedColor: primaryColor,
        ),

        /// Store
        SalomonBottomBarItem(
          activeIcon: Icon(PhosphorIcons.storefront_fill),
          icon: Icon(PhosphorIcons.storefront_light),
          title: Text("Store"),
          selectedColor: primaryColor,
        ),

        /// Wishlist
        SalomonBottomBarItem(
          activeIcon: Icon(PhosphorIcons.heart_straight_fill),
          icon: Icon(PhosphorIcons.heart_straight_light),
          title: Text("Wishlist"),
          selectedColor: primaryColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          activeIcon: Icon(PhosphorIcons.user_circle_bold),
          icon: Icon(PhosphorIcons.user_circle_light),
          title: Text("Profile"),
          selectedColor: primaryColor,
        ),
      ],
    );
  }
}
