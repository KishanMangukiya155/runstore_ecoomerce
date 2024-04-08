import 'package:runstore_ecoomerce/libraries.dart';

class AdvertisingBannerModel {
  AdvertisingBannerModel({
    this.bgImage,
    this.bgColor,
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.foreGroundColor = Colors.black54,
  });

  final String? bgImage;
  final Color? bgColor;
  final String title;
  final String subTitle;
  final IconData iconData;
  final Color? foreGroundColor;
}
