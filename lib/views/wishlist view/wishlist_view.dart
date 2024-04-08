import 'package:runstore_ecoomerce/libraries.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListController = Get.find<WishListController>();
    final rootController = Get.find<RootController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Wishlist",
          leadingCardButton: false,
          actionCardButton: CardButton(
            iconData: Icons.add,
            onTap: () {
              rootController.setNavigationIndex(
                rootController.navigationIndex.toInt() - 2,
              );
            },
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: AppSizes.height * 0.3,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: wishListController.listTile.length,
              padding: EdgeInsets.only(top: AppSizes.defaultVerticalPadding),
              itemBuilder: (context, index) {
                final list = wishListController.listTile[index];
                return Container(
                  height: AppSizes.height * 0.08,
                  child: list,
                  margin: EdgeInsets.symmetric(
                    vertical: AppSizes.defaultHeight / 3,
                  ),
                );
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: wishListController.cartList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final length = wishListController.cartList.length;
              final wishListProduct = wishListController.cartList[index];
              return Container(
                height: AppSizes.height * 0.2,
                width: AppSizes.width,
                margin: EdgeInsets.only(
                  left: AppSizes.extraHorizontalPadding,
                  right: AppSizes.extraHorizontalPadding,
                  bottom: AppSizes.extraVerticalPadding,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product image
                    Container(
                      height: AppSizes.height * 0.17,
                      width: AppSizes.width * 0.25,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(width: AppSizes.defaultWidth * 3),

                    SizedBox(
                      height: AppSizes.height * 0.17,
                      width: AppSizes.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Product name
                          Text(
                            wishListProduct.product_name,
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      fontSizeFactor: 1.5,
                                      fontWeightDelta: -2,
                                    ),
                          ),

                          // Product brief
                          Text(
                            wishListProduct.product_brief.replaceAll(" ", "\n"),
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      fontSizeFactor: 1.1,
                                      fontWeightDelta: -5,
                                      color: Colors.black54,
                                    ),
                          ),

                          // Product Color, Size
                          Row(
                            children: [
                              Text(
                                "${wishListProduct.product_color}, ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                      color: primaryColor,
                                      fontSizeFactor: 1.2,
                                    ),
                              ),
                              Text(
                                wishListProduct.product_size,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                      color: primaryColor,
                                      fontSizeFactor: 1.3,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),

                    // Product Price
                    Text(
                      "\$${wishListProduct.product_price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: Colors.black,
                            fontSizeFactor: 1.35,
                            fontWeightDelta: 1,
                          ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
