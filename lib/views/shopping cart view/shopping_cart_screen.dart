import 'package:runstore_ecoomerce/libraries.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final cartController = Get.find<CartController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Shopping Cart",
          actionCardButton: CardButton(
            iconData: Icons.delete,
            onTap: () {
              cartController.shoppingCartList.clear();
            },
          ),
          leadingCardButton: false,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Obx(() {
        if (cartController.shoppingCartList.isNotEmpty) {
          return ShoppingCartListWidget();
        } else {
          return EmptyShoppingCartWidget();
        }
      }),
    );
  }
}
