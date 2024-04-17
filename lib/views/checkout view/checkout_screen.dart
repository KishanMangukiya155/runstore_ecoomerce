import 'package:easy_stepper/easy_stepper.dart';

import '../../libraries.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final checkOutController = Get.find<CheckOutController>();
    return Scaffold(
      appBar: PreferredSize(
        child: Obx(() {
          return AppbarWidget(
            changeLeadingOnTap: () {
              if (checkOutController.checkoutIndex.value >= 1) {
                checkOutController.setCheckOutIndex(
                    checkOutController.checkoutIndex.value - 1);
              } else {
                Get.back();
              }
            },
            // leadingCardButton: false,
            title: checkOutController
                    .checkOutProcess[checkOutController.checkoutIndex.value]
                ["step"],
            actionCardButton: CardButton(
              iconData: Icons.more_horiz,
              onTap: () {},
            ),
          );
        }),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Obx(() {
        return Column(
          children: [
            // Stepper
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 0.3,
                  ),
                ),
              ),
              child: EasyStepper(
                activeStep: checkOutController.checkoutIndex.value,
                lineStyle: LineStyle(
                  lineLength: AppSizes.width * 0.15,
                  lineThickness: AppSizes.height * 0.005,
                  lineType: LineType.normal,
                  defaultLineColor: Colors.black12,
                  activeLineColor: primaryColor.withOpacity(0.5),
                  finishedLineColor: primaryColor,
                ),

                enableStepTapping: false,

                // Active
                activeStepBorderColor: primaryColor,
                activeStepIconColor: primaryColor,
                activeStepTextColor: primaryColor,
                activeStepBorderType: BorderType.normal,
                borderThickness: AppSizes.height * 0.005,

                // Unreached
                unreachedStepTextColor: primaryColor.withOpacity(0.3),

                // Finished
                finishedStepBorderColor: primaryColor,
                finishedStepIconColor: Colors.white,
                finishedStepTextColor: primaryColor,
                finishedStepBackgroundColor: primaryColor,

                internalPadding: AppSizes.width * 0.02,
                showLoadingAnimation: false,
                stepRadius: AppSizes.height * 0.022,
                steps: List.generate(checkOutController.checkOutProcess.length,
                    (index) {
                  final step = checkOutController.checkOutProcess[index];
                  return EasyStep(
                    icon: Icon(
                      step["icon"],
                    ),
                    finishIcon: Icon(
                      step["icon"],
                      color: Colors.white,
                    ),
                    title: step["step"],
                  );
                }),
                onStepReached: (index) {
                  checkOutController.setCheckOutIndex(index);
                },
              ),
            ),

            // To display the widgets according to the selected step
            // of stepper.
            checkOutController
                    .checkOutProcess[checkOutController.checkoutIndex.value]
                ["widget"]
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        if (checkOutController.checkoutIndex.value !=
            checkOutController.checkOutProcess.length - 1) {
          return Container(
            height: AppSizes.height * 0.07,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(
              bottom: AppSizes.extraVerticalPadding * 2,
              left: AppSizes.extraHorizontalPadding * 1.6,
              right: AppSizes.extraHorizontalPadding * 1.6,
            ),
            child: InkWell(
              onTap: () {
                checkOutController.setCheckOutIndex(
                    checkOutController.checkoutIndex.value + 1);
              },
              child: Center(
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                        color: Colors.white,
                        fontWeightDelta: 2,
                        fontSizeFactor: 1.2,
                      ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
