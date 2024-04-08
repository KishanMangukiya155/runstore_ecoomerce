import 'package:runstore_ecoomerce/libraries.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    this.applyLeading = true,
    this.leadingCardButton = true,
    required this.actionCardButton,
    this.changeLeadingOnTap,
  });

  final String title;
  final bool? applyLeading;
  final bool? leadingCardButton;
  final CardButton actionCardButton;
  final void Function()? changeLeadingOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.extraVerticalPadding * 2.5,
        left: AppSizes.defaultHorizontalPadding,
        right: AppSizes.defaultHorizontalPadding,
        bottom: AppSizes.extraVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          leadingCardButton!
              ? CardButton(
                  iconData: Icons.arrow_back,
                  onTap: changeLeadingOnTap ??
                      () {
                        Get.back();
                      })
              : SizedBox.shrink(),
          Text(
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
          Spacer(),
          actionCardButton,
        ],
      ),
    );
  }
}
