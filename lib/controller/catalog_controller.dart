import 'package:runstore_ecoomerce/libraries.dart';

class CatalogController extends GetxController {
  RxInt customerType = 0.obs;
  final searchTextController = TextEditingController();

  List<String> customerTypeList = ["Men", "Women", "Kids"];

  // This is used to display the banners on top of catalog screen
  List<CatalogBannerModel> bannersList = [
    CatalogBannerModel(
      bgColor: Colors.blue.shade100,
      image: AppImages.fashion_men,
      customerType: "Men",
      customerTypeTextColor: Colors.lightBlue,
      totalProducts: 1.7,
      buttonColor: Colors.lightBlue,
    ),
    CatalogBannerModel(
      bgColor: Colors.red.shade100,
      image: AppImages.fashion_women,
      customerType: "Women",
      customerTypeTextColor: Colors.redAccent,
      totalProducts: 3.4,
      buttonColor: Colors.redAccent,
    ),
    CatalogBannerModel(
      bgColor: Colors.purple.shade100,
      image: AppImages.fashion_kids,
      customerType: "Kids",
      customerTypeTextColor: Colors.purple,
      totalProducts: 1.3,
      buttonColor: Colors.purple,
    ),
  ];

  // This is used to display advertisements on catalog screen
  List<AdvertisingBannerModel> advertisements = [
    AdvertisingBannerModel(
      title: "Free shipping over \$49",
      subTitle: "free returns and exchange",
      iconData: PhosphorIcons.gift,
    ),
  ];

  // This is used to display options on bottom of catalog screen
  List<CustomListTile> catalogOptions = [
    CustomListTile(
      leadingIconData: PhosphorIcons.star,
      title: "Brands",
      onPressed: () {
        Get.to(() => BrandsScreen());
      },
    ),
    CustomListTile(
      leadingIconData: PhosphorIcons.notebook,
      title: "About store",
      onPressed: () {
        Get.to(() => AboutStoreScreen());
      },
    ),
    CustomListTile(
      leadingIconData: Icons.chat_outlined,
      title: "Support",
    ),
    CustomListTile(
      leadingIconData: PhosphorIcons.info,
      title: "FAQ's",
    ),
  ];
}
