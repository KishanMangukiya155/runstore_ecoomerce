import 'package:runstore_ecoomerce/libraries.dart';

class BrandsController extends GetxController {
  // Used to display the brands
  List<BrandModel> brands = [
    BrandModel(
      image: AppImages.fabIndiaLogo,
      name: "Fabindia",
      ratings: 3.4,
    ),
    BrandModel(
      image: AppImages.adidasLogo,
      name: "Adidas",
      ratings: 4.1,
    ),
    BrandModel(
      image: AppImages.nikeLogo,
      name: "Nike",
      ratings: 4.2,
    ),
    BrandModel(
      image: AppImages.leviLogo,
      name: "Levi's",
      ratings: 3.3,
    ),
    BrandModel(
      image: AppImages.hnmLogo,
      name: "H&M",
      ratings: 3.5,
    ),
  ];

  // This is used to display options on bottom of catalog screen
  List<CustomListTile> brandsOptions = [
    CustomListTile(
      leadingIconData: PhosphorIcons.t_shirt,
      title: "Clothes",
    ),
    CustomListTile(
      leadingIconData: PhosphorIcons.storefront,
      title: "Nearby stores",
    ),
    CustomListTile(
      leadingIconData: PhosphorIcons.diamonds_four,
      title: "Accessories",
    ),
  ];
}
