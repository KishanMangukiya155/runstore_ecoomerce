import 'package:runstore_ecoomerce/libraries.dart';

class EmptyShoppingCartWidget extends StatelessWidget {
  const EmptyShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    final cartController = Get.find<CartController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Top Column with header text, brief, primary button.
        Column(
          children: [
            Text(
              "Cart is empty",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontSizeFactor: 2,
                    fontWeightDelta: 2,
                  ),
            ),
            SizedBox(height: AppSizes.defaultHeight / 2),
            Text(
              AppStrings.emptyCartBrief,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    fontSizeFactor: 1.5,
                  ),
            ),
            SizedBox(height: AppSizes.extraDefaultHeight),
            PrimaryButton(
              text: "Start shopping",
              width: AppSizes.width / 2,
              onTap: () {
                rootController.setNavigationIndex(0);
              },
            ),
          ],
        ),

        CustomerTypeWidget(),

        SizedBox(
          height: AppSizes.height * 0.32,
          child: ListView.separated(
            itemCount: cartController.cartList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.extraHorizontalPadding,
            ),
            itemBuilder: (context, index) {
              final products = cartController.cartList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: AppSizes.height * 0.22,
                        width: AppSizes.width * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(products.product_image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    products.product_name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                          fontWeightDelta: 2,
                        ),
                  ),
                  Text(
                    "${products.product_brief}".replaceAll(" ", "\n"),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontWeightDelta: -4,
                        ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: AppSizes.extraDefaultWidth);
            },
          ),
        ),
      ],
    );
  }
}
