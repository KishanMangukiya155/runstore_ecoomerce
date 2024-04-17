import 'package:runstore_ecoomerce/libraries.dart';

class CartController extends GetxController {
  List<ProductModel> cartList = [
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage1,
      product_name: "Benetton",
      product_brief: "Ex-boyfriend TruckerJacket",
      product_color: "Blue",
      product_size: "M",
      product_price: 129.99,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage2,
      product_name: "Baon",
      product_brief: "Texture-Knit Sweater",
      product_color: "Red",
      product_size: "S",
      product_price: 62.50,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage3,
      product_name: "Reebok",
      product_brief: "Puff-sleeve SweatShirt",
      product_color: "Turquoise",
      product_size: "M",
      product_price: 69.75,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage4,
      product_name: "Columbia",
      product_brief: "Mount Whitney Windbreaker",
      product_color: "Pink",
      product_size: "M",
      product_price: 85.90,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage1,
      product_name: "Benetton",
      product_brief: "Ex-boyfriend TruckerJacket",
      product_color: "Blue",
      product_size: "M",
      product_price: 129.99,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage2,
      product_name: "Baon",
      product_brief: "Texture-Knit Sweater",
      product_color: "Red",
      product_size: "S",
      product_price: 62.50,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage3,
      product_name: "Reebok",
      product_brief: "Puff-sleeve SweatShirt",
      product_color: "Turquoise",
      product_size: "M",
      product_price: 69.75,
    ),
    ProductModel(
      category_name: "Clothing",
      product_image: AppImages.productImage4,
      product_name: "Columbia",
      product_brief: "Mount Whitney Windbreaker",
      product_color: "Pink",
      product_size: "M",
      product_price: 85.90,
    ),
  ];

  var shoppingCartList = {}.obs;

  // To add the products with quantity
  void addProductInShoppingCart(ProductModel productModel) {
    if (shoppingCartList.containsKey(productModel)) {
      shoppingCartList[productModel] += 1;
      print("${shoppingCartList.keys} ${shoppingCartList.values}");
    } else {
      shoppingCartList[productModel] = 1;

      print("${shoppingCartList.keys} ${shoppingCartList.values}");
    }
  }

  // To remove the product's quantity or product
  void removeProductOrProductQuantity(ProductModel productModel) {
    // It removes the product if both the conditions are true
    if (shoppingCartList.containsKey(productModel) &&
        shoppingCartList[productModel] == 1) {
      shoppingCartList.removeWhere((key, value) => key == productModel);
      print(shoppingCartList.values);
    }
    // It only removes the quantity
    else {
      shoppingCartList[productModel] -= 1;
      print(shoppingCartList.values);
    }
  }

  // To adds the product's quantity
  void addProductQuantity(ProductModel productModel) {
    shoppingCartList[productModel] += 1;
    print(shoppingCartList.values);
  }

  // To remove the product from shopping cart list
  void removeProduct(ProductModel productModel) {
    shoppingCartList.removeWhere((key, value) => key == productModel);
  }

  // To calculate the subtotal of product
  String productSubTotal() {
    return shoppingCartList.entries
        .map((product) => product.key.product_price * product.value)
        .toList()
        .toString();
  }

  // To calculate the total of product
  String productTotal() {
    return shoppingCartList.entries
        .map((product) => product.key.product_price * product.value)
        .toList()
        .reduce((value, element) => value + element)
        .toString();
  }
}
