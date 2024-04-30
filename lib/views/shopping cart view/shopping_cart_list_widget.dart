import 'package:runstore_ecoomerce/libraries.dart';

class ShoppingCartListWidget extends StatelessWidget {
  const ShoppingCartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final wishListController = Get.find<WishListController>();
    return Stack(
      children: [
        ListView.separated(
          shrinkWrap: true,
          reverse: true,
          itemCount: cartController.shoppingCartList.length,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: AppSizes.extraHorizontalPadding,
            right: AppSizes.extraHorizontalPadding,
            top: AppSizes.extraVerticalPadding,
            bottom: AppSizes.extraVerticalPadding * 4,
          ),
          itemBuilder: (context, index) {
            return buildShoppingCartListWidget(
              context: context,
              cartController: cartController,
              productModel:
                  cartController.shoppingCartList.keys.toList()[index],
              quantity: cartController.shoppingCartList.values.toList()[index],
              wishListController: wishListController,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: AppSizes.defaultHeight);
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: AppSizes.height * 0.07,
            width: AppSizes.width - AppSizes.extraHorizontalPadding,
            margin: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultHorizontalPadding * 1.4,
            ),
            child: PrimaryButton(
              text: "Go to checkout - \$${cartController.productTotal()}",
              width: AppSizes.width,
              onTap: () {
                Get.to(() => CheckOutScreen());
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildShoppingCartListWidget({
    required BuildContext context,
    required CartController cartController,
    required ProductModel productModel,
    required int quantity,
    required WishListController wishListController,
  }) {
    return Container(
      height: AppSizes.height * 0.25,
      width: AppSizes.width,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          Container(
            height: AppSizes.height * 0.23,
            width: AppSizes.width * 0.25,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(productModel.product_image),
              ),
            ),
          ),
          SizedBox(width: AppSizes.defaultWidth * 3),

          Expanded(
            flex: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product name and Remove product
                Text(
                  productModel.product_name,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontSizeFactor: 1.1,
                      ),
                ),

                // Product brief
                Text(
                  productModel.product_brief,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        fontSizeFactor: 0.9,
                        fontWeightDelta: -5,
                        color: Colors.black54,
                      ),
                ),

                // Product Color, Size, Price
                Row(
                  children: [
                    Text(
                      "${productModel.product_color}, ",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: primaryColor,
                            fontSizeFactor: 1.2,
                          ),
                    ),
                    Text(
                      productModel.product_size,
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: primaryColor,
                            fontSizeFactor: 1.2,
                          ),
                    ),
                    Spacer(),
                    Text(
                      "\$${(productModel.product_price * quantity).toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: Colors.black54,
                            fontSizeFactor: 1.35,
                            fontWeightDelta: 1,
                          ),
                    ),
                  ],
                ),

                // Manage quantity, Add to wishlist, Remove from cart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppSizes.width * 0.28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Add quantity
                          InkWell(
                            onTap: () {
                              cartController.addProductQuantity(productModel);
                            },
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.4),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.add,
                                size: AppSizes.defaultHeight * 1.25,
                              ),
                            ),
                          ),

                          // Product's quantity
                          Flexible(
                            child: Text(
                              quantity.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(fontSizeFactor: 1.35),
                            ),
                          ),

                          // Remove quantity
                          InkWell(
                            onTap: () {
                              cartController
                                  .removeProductOrProductQuantity(productModel);
                            },
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.4),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.remove,
                                size: AppSizes.defaultHeight * 1.25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Favorite Button
                    IconButton(
                      onPressed: () {
                        wishListController.checkProduct(productModel);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      icon: Obx(() {
                        final contains = wishListController.wishListProduct
                            .contains(productModel);
                        return Icon(
                          contains ? Icons.favorite : Icons.favorite_outline,
                          color: contains ? Colors.red : Colors.black54,
                        );
                      }),
                    ),

                    // Delete Button
                    IconButton(
                      onPressed: () {
                        cartController.removeProduct(productModel);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
