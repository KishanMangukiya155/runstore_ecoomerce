import 'package:runstore_ecoomerce/libraries.dart';

class ProductCartList extends StatelessWidget {
  const ProductCartList({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.defaultHeight / 2),

        // "In your cart" Row
        Row(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: AppSizes.defaultHeight * 1.5,
              weight: AppSizes.defaultWidth * 1.5,
              color: primaryColor,
            ),
            SizedBox(width: AppSizes.defaultWidth * 4),
            Text(
              "In your cart",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    color: Colors.black,
                    fontSizeFactor: 1.2,
                  ),
            ),
            Spacer(),
            Text(
              cartController.cartList.length.toString(),
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    color: primaryColor,
                    fontSizeFactor: 1.3,
                  ),
            ),
            SizedBox(width: AppSizes.defaultWidth * 2.2),
          ],
        ),
        SizedBox(height: AppSizes.defaultHeight / 2),

        Expanded(
          child: ListView.separated(
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

                    SizedBox(
                      height: AppSizes.height * 0.17,
                      width: AppSizes.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Product name
                          Text(
                            product.product_name,
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      fontSizeFactor: 1.5,
                                      fontWeightDelta: -2,
                                    ),
                          ),

                          // Product brief
                          Text(
                            product.product_brief.replaceAll(" ", "\n"),
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
                    Spacer(),

                    // Product Price
                    Text(
                      "\$${product.product_price}",
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
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.defaultHeight);
            },
          ),
        ),
      ],
    );
  }
}
