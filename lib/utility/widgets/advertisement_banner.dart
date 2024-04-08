import 'package:runstore_ecoomerce/libraries.dart';

class AdvertisementBanner extends StatelessWidget {
  const AdvertisementBanner({
    super.key,
    required this.advertisement,
  });

  final AdvertisingBannerModel advertisement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height * 0.13,
      decoration: BoxDecoration(
        color: advertisement.bgColor ?? primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            advertisement.iconData,
            color: advertisement.foreGroundColor ?? primaryColor,
          ),

          // Advertisement Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Advertisement Title
              Text(
                advertisement.title,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontSizeFactor: 1.3,
                      color: advertisement.foreGroundColor ?? primaryColor,
                    ),
              ),

              // Advertisement Subtitle
              Text(
                advertisement.subTitle,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      fontSizeFactor: 1.2,
                      color: advertisement.foreGroundColor ?? primaryColor,
                    ),
              ),
            ],
          ),

          Icon(
            advertisement.iconData,
            color: advertisement.foreGroundColor ?? primaryColor,
          ),
        ],
      ),
    );
  }
}
