import 'package:runstore_ecoomerce/libraries.dart';

class VerticalProductView extends StatelessWidget {
  const VerticalProductView({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.discountPrice,
    this.actualPrice,
    required this.index,
    required this.productModel,
  });

  final int index;
  final ProductModel productModel;

  final String? image;
  final String? title;
  final String? subTitle;
  final double? discountPrice;
  final double? actualPrice;

  @override
  Widget build(BuildContext context) {
    final wishListController = Get.find<WishListController>();
    final cartController = Get.find<CartController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: AppSizes.height * 0.25,
              width: AppSizes.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(productModel.product_image),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // "Add to WishList" button
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  wishListController.checkProduct(productModel);
                },
                icon: Obx(() {
                  final contains =
                      wishListController.wishListProduct.contains(productModel);
                  return Icon(
                    contains ? Icons.favorite : Icons.favorite_outline,
                    color: contains ? Colors.red : Colors.black,
                  );
                }),
              ),
            ),

            // "Add to shopping cart" button
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  cartController.addProductInShoppingCart(productModel);
                },
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                child: Obx(() {
                  final contains =
                      cartController.shoppingCartList.containsKey(productModel);
                  return Container(
                    height: AppSizes.height * 0.05,
                    width: AppSizes.width * 0.1,
                    decoration: BoxDecoration(
                      color: contains ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: contains
                        ? Center(
                            child: Text(
                              cartController.shoppingCartList[productModel]
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    color: Colors.white,
                                  ),
                            ),
                          )
                        : Icon(
                            Icons.add_shopping_cart,
                            size: AppSizes.defaultHeight,
                            color: Colors.black,
                          ),
                  );
                }),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.height * 0.01),

        // Product name
        Text(
          productModel.product_name,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.titleMedium!.apply(
                fontWeightDelta: -1,
                fontSizeFactor: 1.3,
              ),
        ),
        SizedBox(height: AppSizes.height * 0.005),

        // Product brief
        Text(
          subTitle ?? "Regular Fit Hoodie",
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.titleMedium!.apply(
                fontWeightDelta: -3,
                fontSizeFactor: 1,
              ),
        ),
        SizedBox(height: AppSizes.height * 0.005),

        // Discount price and actual price
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: " \$${productModel.product_price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: primaryColor,
                      fontWeightDelta: -2,
                    ),
              ),
              TextSpan(text: "    "),
              TextSpan(
                text: "\$${actualPrice?.toStringAsFixed(2) ?? "24.99"}",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeightDelta: -2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
