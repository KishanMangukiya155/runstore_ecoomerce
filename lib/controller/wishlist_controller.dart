import 'package:runstore_ecoomerce/libraries.dart';

class WishListController extends GetxController {
  RxList<ProductModel> wishListProduct = <ProductModel>[].obs;

  // This function is used to add or remove the products in
  // wishListProduct's List and wishListCategory list
  void checkProduct(ProductModel product) {
    if (wishListProduct.contains(product)) {
      wishListProduct.remove(product);
    } else {
      wishListProduct.add(product);
    }
  }
}
