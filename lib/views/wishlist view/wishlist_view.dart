import 'package:runstore_ecoomerce/libraries.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final wishListController = Get.find<WishListController>();
    final rootController = Get.find<RootController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Wishlist",
          leadingCardButton: false,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Obx(
        () {
          if (wishListController.wishListProduct.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: wishListController.wishListProduct.length,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.extraHorizontalPadding,
                vertical: AppSizes.extraVerticalPadding,
              ),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildWishListHorizontalWidget(
                  context,
                  wishListController.wishListProduct[index],
                  wishListController,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight);
              },
            );
          } else {
            return EmptyWishlistWidget();
          }
        },
      ),
    );
  }

  Container buildWishListHorizontalWidget(
    BuildContext context,
    ProductModel productModel,
    WishListController wishListController,
  ) {
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
                      "\$${productModel.product_price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: Colors.black54,
                            fontSizeFactor: 1.35,
                            fontWeightDelta: 1,
                          ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        wishListController.checkProduct(productModel);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      icon: Obx(() {
                        var wishListContains = wishListController
                            .wishListProduct
                            .contains(productModel);
                        return Icon(
                          wishListContains
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: wishListContains
                              ? Colors.redAccent
                              : Colors.black54,
                        );
                      }),
                    ),
                    PrimaryButton(
                      text: "Add to cart",
                      height: AppSizes.height * 0.04,
                      width: AppSizes.width * 0.4,
                      newTextStyle:
                          Theme.of(context).textTheme.titleSmall!.apply(
                                color: Colors.white,
                                fontSizeFactor: 1.2,
                                fontWeightDelta: 2,
                              ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
