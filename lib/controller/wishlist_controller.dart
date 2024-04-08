import 'package:runstore_ecoomerce/libraries.dart';

class WishListController extends GetxController {
  List<ProductModel> cartList = [
    ProductModel(
      product_image: "",
      product_name: "Benetton",
      product_brief: "Ex-boyfriend TruckerJacket",
      product_color: "Blue",
      product_size: "M",
      product_price: 129.99,
    ),
    ProductModel(
      product_image: "",
      product_name: "Baon",
      product_brief: "Texture-Knit Sweater",
      product_color: "Red",
      product_size: "S",
      product_price: 62.50,
    ),
    ProductModel(
      product_image: "",
      product_name: "Reebok",
      product_brief: "Puff-sleeve SweatShirt",
      product_color: "Turquoise",
      product_size: "M",
      product_price: 69.75,
    ),
    ProductModel(
      product_image: "",
      product_name: "Columbia",
      product_brief: "Mount Whitney Windbreaker",
      product_color: "Pink",
      product_size: "M",
      product_price: 85.90,
    ),
  ];

  List<ProductModel> emptyCartList = [];

  List<CustomListTile> listTile = [
    CustomListTile(
      leadingIconData: PhosphorIcons.t_shirt,
      title: "Clothing",
      onPressed: () {},
    ),
    CustomListTile(
      leadingIconData: Icons.watch,
      title: "SmartWatch",
      onPressed: () {},
    ),
    CustomListTile(
      leadingIconData: PhosphorIcons.device_mobile,
      title: "SmartPhone",
      onPressed: () {},
    ),
  ];
}
