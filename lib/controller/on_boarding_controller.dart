import 'package:runstore_ecoomerce/libraries.dart';

class OnBoardingScreenController extends GetxController {
  List<SliderModel> onBoardSlides = [
    SliderModel(
      title: AppStrings.welcome,
      subTitle: AppStrings.welcomeBrief,
      image: AppImages.bgImg,
    ),
    SliderModel(
      title: AppStrings.account,
      subTitle: AppStrings.welcomeBrief,
      image: AppImages.bgImg2,
    ),
    SliderModel(
      title: AppStrings.news,
      subTitle: AppStrings.welcomeBrief,
      image: AppImages.bgImg3,
    ),
  ];

  RxInt pageIndex = 0.obs;
  final pageController = PageController(initialPage: 0);

  void setOnBoardingPageIndex(int value) {
    pageIndex(value);
    update();
  }
}
