import 'package:runstore_ecoomerce/libraries.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.applyPaddingOnIcon,
    this.leadingIconData,
    this.onPressed,
    this.newTrailingWidget,
    this.changeLeadingWidget = false,
    this.leadingWidget = const SizedBox.shrink(),
    this.subTitle,
  });

  final String title;
  final bool? changeLeadingWidget;
  final Widget leadingWidget;
  final IconData? leadingIconData;
  final String? subTitle;
  final void Function()? onPressed;
  final Widget? newTrailingWidget;
  final EdgeInsets? applyPaddingOnIcon;

  @override
  Widget build(BuildContext context) {
    // return buildListTile(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Leading Icon or Widget
        changeLeadingWidget!
            ? leadingWidget
            : Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(
                  right: AppSizes.defaultHorizontalPadding / 2,
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

        SizedBox(width: AppSizes.defaultWidth),
        // Title or (SubTitle - condition)
        subTitle != null
            ? Flexible(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            fontSizeFactor: 1.4,
                            fontWeightDelta: 1,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : secondaryColor,
                          ),
                    ),
                    SizedBox(height: AppSizes.height * 0.005),
                    Text(
                      subTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      fontSizeFactor: 1.4,
                      fontWeightDelta: 1,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : secondaryColor,
                    ),
              ),

        Spacer(),
        // Trailing widget
        newTrailingWidget ??
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.arrow_forward,
                size: AppSizes.height * 0.03,
                color: primaryColor,
              ),
            ),
      ],
    );
  }
}
