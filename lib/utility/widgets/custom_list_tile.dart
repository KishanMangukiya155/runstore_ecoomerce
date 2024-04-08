import 'package:runstore_ecoomerce/libraries.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.applyPaddingOnIcon,
    required this.leadingIconData,
    required this.title,
    this.onPressed,
    this.newTrailingWidget,
  });

  final IconData leadingIconData;
  final String title;
  final void Function()? onPressed;
  final Widget? newTrailingWidget;
  final EdgeInsets? applyPaddingOnIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultHorizontalPadding / 2,
      ),
      leading: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: applyPaddingOnIcon ?? EdgeInsets.all(10),
        child: Icon(
          leadingIconData,
          size: AppSizes.height * 0.033,
          color: Theme.of(context).brightness == Brightness.light
              ? primaryColor
              : secondaryColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.apply(
              fontSizeFactor: 1.4,
              fontWeightDelta: 1,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : secondaryColor,
            ),
      ),
      trailing: newTrailingWidget ??
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward,
              size: AppSizes.height * 0.03,
              color: primaryColor,
            ),
          ),
    );
  }
}
