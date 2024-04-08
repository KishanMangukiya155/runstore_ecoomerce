import 'package:runstore_ecoomerce/libraries.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Shopping Cart",
          actionCardButton: CardButton(
            iconData: Icons.more_horiz,
            onTap: () {},
          ),
          leadingCardButton: false,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.extraHorizontalPadding,
          vertical: AppSizes.defaultVerticalPadding,
        ),
        children: [
          if (cartController.cartList.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              itemCount: cartController.cartList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final product = cartController.cartList[index];
                return Container(
                  height: AppSizes.height * 0.2,
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
                        height: AppSizes.height * 0.17,
                        width: AppSizes.width * 0.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(width: AppSizes.defaultWidth * 3),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Product name
                                Text(
                                  product.product_name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                        fontSizeFactor: 1.5,
                                        fontWeightDelta: -2,
                                      ),
                                ),

                                // Product Price
                                Text(
                                  "\$${product.product_price.toStringAsFixed(2)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        color: Colors.black,
                                        fontSizeFactor: 1.35,
                                        fontWeightDelta: 1,
                                      ),
                                ),
                              ],
                            ),

                            // Product brief
                            Text(
                              product.product_brief.replaceAll(" ", "\n"),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    fontSizeFactor: 1.1,
                                    fontWeightDelta: -5,
                                    color: Colors.black54,
                                  ),
                            ),

                            // Product Color, Size
                            Row(
                              children: [
                                Text(
                                  "${product.product_color}, ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        color: primaryColor,
                                        fontSizeFactor: 1.2,
                                      ),
                                ),
                                Text(
                                  product.product_size,
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
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight);
              },
            ),
          ],
          SizedBox(height: AppSizes.defaultHeight),
          Container(
            height: AppSizes.height * 0.07,
            width: AppSizes.width - AppSizes.extraHorizontalPadding,
            child: PrimaryButton(
              text: "Go to checkout - \$384.14",
              width: AppSizes.width,
              onTap: () {
                Get.to(() => CheckOutScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
