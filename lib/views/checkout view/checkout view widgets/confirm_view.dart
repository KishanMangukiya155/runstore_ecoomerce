import 'package:runstore_ecoomerce/libraries.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final cartController = Get.find<CartController>();
    // final checkOutController = Get.find<CheckOutController>();
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(
          top: AppSizes.extraVerticalPadding,
          left: AppSizes.extraHorizontalPadding,
          right: AppSizes.extraHorizontalPadding,
        ),
        physics: ScrollPhysics(),
        children: [
          // 1: Display the shopping cart's list
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartController.shoppingCartList.keys.toList().length,
            itemBuilder: (context, index) {
              final product =
                  cartController.shoppingCartList.keys.toList()[index];
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
                        image: DecorationImage(
                          image: AssetImage(product.product_image),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.defaultWidth * 3),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Product name and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.product_name,
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
                            product.product_brief,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.defaultHeight);
            },
          ),

          CustomDividerWidget(),

          // 2: Delivery with tax, address, expected days
          Column(
            children: [
              // Delivery with tax
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: AppSizes.height * 0.06,
                    width: AppSizes.width * 0.13,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(right: AppSizes.defaultWidth * 3),
                    child: Icon(
                      Icons.local_shipping_outlined,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "Delivery",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(fontSizeFactor: 1.1),
                  ),
                  Spacer(),
                  Text(
                    "+\$2.50",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.defaultHeight),

              // address
              Text(
                AppStrings.userAddress,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: Colors.grey,
                      fontWeightDelta: -3,
                    ),
              ),
              SizedBox(height: AppSizes.defaultHeight * 1.5),

              // expected days
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Standard",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontWeightDelta: -2,
                        ),
                  ),
                  Text(
                    "2-3 Days delivery",
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: Colors.grey,
                          fontWeightDelta: -2,
                        ),
                  ),
                ],
              ),
            ],
          ),

          CustomDividerWidget(),

          // 3: payment method
          Column(
            children: [
              // Payment
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: AppSizes.height * 0.06,
                    width: AppSizes.width * 0.13,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(right: AppSizes.defaultWidth * 3),
                    child: Icon(
                      Icons.credit_card_rounded,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "Payment",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(fontSizeFactor: 1.1),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.defaultHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit Card",
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              fontSizeFactor: 1.2,
                            ),
                      ),
                      SizedBox(height: AppSizes.defaultHeight / 2),
                      Text(
                        "****  ****  ****  3208",
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: Colors.grey,
                              fontSizeFactor: 1.2,
                            ),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.masterCard,
                    height: AppSizes.height * 0.12,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // A container that displays the total amount
          // with primary button
          Container(
            height: AppSizes.height * 0.18,
            width: AppSizes.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            fontSizeFactor: 1.2,
                          ),
                    ),
                    Text(
                      "\$${cartController.productTotal()}",
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            fontSizeFactor: 1.2,
                          ),
                    ),
                  ],
                ),
                PrimaryButton(
                  text: "Order now",
                  width: AppSizes.width,
                  onTap: () {
                    Get.offAll(() => ConfirmationSuccessScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
