import 'package:runstore_ecoomerce/libraries.dart';

enum CustomerTypes { All, Men, Women, Kids }

class HomeController extends GetxController {
  RxInt customerType = 0.obs;
  RxInt homeFilterIndex = 0.obs;
  Rx<CustomerTypes>? customerTypes = CustomerTypes.All.obs;

  List<String> customerTypeList = ["All", "Men", "Women", "Kids"];

  List<ListTile> homeFilterList = [
    ListTile(
      selectedColor: primaryColor,
      title: Text("Popular"),
      onTap: () {},
    ),
    ListTile(
      title: Text("Newest"),
      onTap: () {},
    ),
    ListTile(
      title: Text("Recommended"),
      onTap: () {},
    ),
  ];

  // This is used to display advertisements on home screen
  List<HomeBannerModel> banner = [
    HomeBannerModel(image: AppImages.home_banner),
  ];

  // This is used to display advertisements on home screen
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

  // This is used to display the products on home screen
  List<ProductModel> allProducts = [
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage1,
      product_name: "H&M",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "black",
      product_size: "m",
      product_price: 40.00,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage2,
      product_name: "Baon",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "brown",
      product_size: "m",
      product_price: 60.00,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage3,
      product_name: "Burton Menswear",
      product_brief:
          "quaerendum no intellegat vivamus adipiscing tellus dapibus pellentesque sociis solet auctor omnesque",
      product_color: "black",
      product_size: "m",
      product_price: 40.00,
    ),
    ProductModel(
      category_name: "Clothing",
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
