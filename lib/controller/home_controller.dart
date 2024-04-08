import 'package:runstore_ecoomerce/libraries.dart';

class HomeController extends GetxController {
  RxInt customerType = 0.obs;

  List<String> customerTypeList = ["All", "Men", "Women", "Kids"];

  // This is used to display advertisements on catalog screen
  List<HomeBannerModel> banner = [
    HomeBannerModel(image: AppImages.home_banner),
  ];

  // This is used to display advertisements on catalog screen
  List<AdvertisingBannerModel> advertisements = [
    AdvertisingBannerModel(
      title: "Free shipping over \$49",
      subTitle: "free returns and exchange",
      iconData: PhosphorIcons.gift,
      bgColor: Colors.green.shade200,
      foreGroundColor: Colors.green.shade900,
    ),
    AdvertisingBannerModel(
      title: "Grab the discount 80% off",
      subTitle: "Flash sale no returns",
      iconData: Icons.discount,
      bgColor: Colors.deepOrange.shade200,
      foreGroundColor: Colors.orange.shade900,
    ),
  ];

  List<ProductModel> allProducts = [
    ProductModel(
      product_image: AppImages.productImage1,
      product_name: "H&M",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "black",
      product_size: "m",
      product_price: 40.00,
    ),
    ProductModel(
      product_image: AppImages.productImage2,
      product_name: "Baon",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "brown",
      product_size: "m",
      product_price: 60.00,
    ),
    ProductModel(
      product_image: AppImages.productImage3,
      product_name: "Burton Menswear",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "black",
      product_size: "m",
      product_price: 40.00,
    ),
    ProductModel(
      product_image: AppImages.productImage4,
      product_name: "Baon",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "black",
      product_size: "m",
      product_price: 40.00,
    ),
  ];
}
