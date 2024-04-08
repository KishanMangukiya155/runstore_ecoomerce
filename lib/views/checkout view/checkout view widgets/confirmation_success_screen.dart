import 'package:lottie/lottie.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class ConfirmationSuccessScreen extends StatelessWidget {
  const ConfirmationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.extraDefaultHeight * 2),
            Text(
              "Finish",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .apply(fontSizeFactor: 1.2),
            ),
            SizedBox(height: AppSizes.extraDefaultHeight),

            // Lottie Animation
            Lottie.asset(
              height: AppSizes.height * 0.35,
              AppImages.success_Animation,
            ),
            SizedBox(height: AppSizes.extraDefaultHeight),

            // 'Confirmation\nSuccess' text
            Text(
              "Confirmation\nSuccess",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: Colors.black,
                    fontSizeFactor: 1.2,
                    fontWeightDelta: 1,
                  ),
            ),
            SizedBox(height: AppSizes.defaultHeight / 2),

            // 'order code' text
            Text(
              "Your order code is #890012",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontWeightDelta: -3,
                  ),
            ),

            // 'ThankYou' text
            Text(
              AppStrings.thankYou,
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontWeightDelta: -3,
                  ),
            ),
            SizedBox(height: AppSizes.extraDefaultHeight),

            // 'Continue Shopping' text
            PrimaryButton(
              text: "Continue Shopping",
              width: AppSizes.extraHorizontalPadding * 16,
              onTap: () {
                Get.offAll(
                  () => RootScreen(),
                );
              },
            ),
            SizedBox(height: AppSizes.extraDefaultHeight),

            // 'Track Order' text
            PrimaryButton(
              text: "Track order",
              width: AppSizes.extraHorizontalPadding * 16,
              onTap: () {
                Get.to(() => TrackOrderScreen());
              },
              isPrimary: false,
            ),
          ],
        ),
      ),
    );
  }
}
