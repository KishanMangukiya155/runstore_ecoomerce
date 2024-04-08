// import 'package:easy_stepper/easy_stepper.dart';
import 'package:runstore_ecoomerce/libraries.dart';
import 'package:another_stepper/another_stepper.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutController = Get.find<CheckOutController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Track Order",
          actionCardButton:
              CardButton(iconData: Icons.more_horiz, onTap: () {}),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: AppSizes.height * 0.05),

            // 'Order code' text
            Text(
              "Your order code : #890012",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: Colors.black87,
                    fontSizeFactor: 1.2,
                    fontWeightDelta: -2,
                  ),
            ),

            // 'Number of items with price'
            Text(
              "3 items - \$264.74",
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: Colors.black87,
                    fontSizeFactor: 1.2,
                    fontWeightDelta: -2,
                  ),
            ),
            SizedBox(height: AppSizes.height * 0.04),

            // Stepper
            Expanded(
              child: Stepper(
                currentStep: 0,
                controlsBuilder: (context, details) {
                  return Container();
                },
                steps: [
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivered",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.1,
                              ),
                        ),
                        Text("Estimated For 17 November, 2024"),
                      ],
                    ),
                    content: SizedBox(),
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Out for delivery",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.1,
                              ),
                        ),
                        Text("Estimated For 17 November, 2024"),
                      ],
                    ),
                    content: SizedBox(),
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order shipped",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.1,
                              ),
                        ),
                        Text("Estimated For 17 November, 2024"),
                      ],
                    ),
                    content: SizedBox(),
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirmed",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.1,
                              ),
                        ),
                        Text("Your order has been confirmed"),
                      ],
                    ),
                    content: SizedBox(),
                  ),
                  Step(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order placed",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                fontSizeFactor: 1.1,
                              ),
                        ),
                        Text("We have received your order"),
                      ],
                    ),
                    content: SizedBox(),
                  ),
                ],
              ),
            ),

            PrimaryButton(
              text: "Continue Shopping",
              width: AppSizes.width - AppSizes.extraHorizontalPadding * 3,
              onTap: () {
                Get.offAll(() => RootScreen());
              },
            ),
            SizedBox(height: AppSizes.height * 0.07),
          ],
        ),
      ),
    );
  }
}
