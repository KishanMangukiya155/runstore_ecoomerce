import 'package:lottie/lottie.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class EmptyWishlistWidget extends StatelessWidget {
  const EmptyWishlistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSizes.height * 0.3,
            child: Lottie.asset(
              AppImages.emptyWishlist_Animation,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: AppSizes.defaultHeight),
          Text(
            AppStrings.emptyWishListString,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.defaultHeight),
          PrimaryButton(
            text: "Add Product",
            width: AppSizes.extraDefaultWidth * 20,
            onTap: () {
              rootController.setNavigationIndex(0);
            },
          ),
        ],
      ),
    );
  }
}
