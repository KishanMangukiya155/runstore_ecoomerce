import 'package:runstore_ecoomerce/libraries.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    this.leadingCardButton = true,
    this.actionCardButton,
    this.changeLeadingOnTap,
  });

  final String title;
  final bool? leadingCardButton;
  final CardButton? actionCardButton;
  final void Function()? changeLeadingOnTap;

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    final paddingConditions =
        rootController.navigationIndex.value == 0 || leadingCardButton!;

    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.extraVerticalPadding * 3,
        left: paddingConditions ? AppSizes.defaultHorizontalPadding : 0,
        right: AppSizes.defaultHorizontalPadding,
        bottom: AppSizes.extraVerticalPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Shows user profile picture only on homepage
          rootController.navigationIndex.value == 0
              ? CircleAvatar(
                  maxRadius: AppSizes.height * 0.025,
                  backgroundColor: Colors.grey.shade100,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.black,
                          width: AppSizes.defaultWidth / 3),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppImages.profile_pic,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          // Shows the leading card button widget if necessary
          leadingCardButton!
              ? Padding(
                  padding:
                      EdgeInsets.only(right: AppSizes.extraDefaultWidth * 8),
                  child: CardButton(
                      iconData: Icons.arrow_back,
                      onTap: changeLeadingOnTap ??
                          () {
                            Get.back();
                          }),
                )
              : SizedBox.shrink(),

          // Title of the appbar
          Padding(
            padding: EdgeInsets.only(
                left:
                    leadingCardButton! ? 0 : AppSizes.defaultHorizontalPadding),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    color: Theme.of(context).colorScheme.brightness ==
                            Brightness.dark
                        ? secondaryColor
                        : Colors.black,
                    fontSizeFactor: 1.4,
                  ),
            ),
          ),
          Spacer(),

          // By default action card button
          actionCardButton ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
