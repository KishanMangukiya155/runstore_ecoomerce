import 'package:runstore_ecoomerce/libraries.dart';

class BoardingScreen extends StatelessWidget {
  BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.find<OnBoardingScreenController>();
    return Material(
      color: secondaryColor,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // PageView to display pictures
          PageView(
            controller: onBoardingController.pageController,
            children: List.generate(
              onBoardingController.onBoardSlides.length,
              (index) => Container(
                height: AppSizes.height,
                width: AppSizes.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      onBoardingController.onBoardSlides[index].image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            onPageChanged: (value) {
              onBoardingController.setOnBoardingPageIndex(value);
            },
          ),

          // A Column that displays....
          // 1 : "Skip" Text
          // 2 : A curved container sticked at bottom
          Column(
            children: [
              SizedBox(height: 50),

              // 1 : "Skip" Text
              Obx(() {
                if (onBoardingController.onBoardSlides.length - 1 ==
                    onBoardingController.pageIndex.value) {
                  return SizedBox();
                } else {
                  return InkWell(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: AppSizes.defaultHorizontalPadding * 22,
                      ),
                      child: Text(
                        "Skip",
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: Colors.white,
                              fontWeightDelta: 1,
                              fontSizeFactor: 1.2,
                            ),
                      ),
                    ),
                  );
                }
              }),

              Spacer(),

              // 2 : A curved container sticked at bottom
              // placed inside Bottom Sheet
              BottomSheet(
                onClosing: () {},
                enableDrag: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(31),
                    right: Radius.circular(31),
                  ),
                ),
                builder: (BuildContext context) {
                  return Obx(() {
                    return BottomSheetContainer(
                      height: AppSizes.height * 0.32,
                      applyFormPadding: false,
                      childWidget: Column(
                        children: [
                          SizedBox(height: AppSizes.defaultHeight * 3),
                          Text(
                            onBoardingController
                                .onBoardSlides[
                                    onBoardingController.pageIndex.toInt()]
                                .title,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: AppSizes.defaultHeight / 1.2),
                          Text(
                            onBoardingController
                                .onBoardSlides[
                                    onBoardingController.pageIndex.toInt()]
                                .subTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: AppSizes.defaultVerticalPadding),
                          // A page indicators
                          Obx(() {
                            return onBoardingController.onBoardSlides.length -
                                        1 ==
                                    onBoardingController.pageIndex.value
                                ? PrimaryButton(
                                    text: "Get Started",
                                    width: AppSizes.width -
                                        AppSizes.defaultVerticalPadding,
                                    onTap: () {
                                      Get.off(LoginScreen());
                                    },
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.width / 2.6,
                                        vertical: AppSizes.height / 35),
                                    child: Row(
                                      children: List.generate(
                                        onBoardingController
                                            .onBoardSlides.length,
                                        (index) => Obx(() {
                                          return Container(
                                            height: 5,
                                            width: onBoardingController
                                                        .pageIndex.value ==
                                                    index
                                                ? AppSizes.width * 0.06
                                                : AppSizes.width * 0.02,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: onBoardingController
                                                          .pageIndex.value ==
                                                      index
                                                  ? primaryColor
                                                  : offPrimaryColor,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                          }),
                        ],
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
