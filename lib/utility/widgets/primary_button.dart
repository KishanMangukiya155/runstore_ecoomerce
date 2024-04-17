import '../../libraries.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.iconData,
    this.isPrimary = true,
    required this.text,
    required this.width,
    required this.onTap,
    this.height,
    this.newTextStyle,
  });

  final bool? isPrimary;
  final IconData? iconData;
  final String text;
  final double width;
  final double? height;
  final TextStyle? newTextStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStatePropertyAll(
        Colors.transparent,
      ),
      child: Container(
        height: height ?? AppSizes.height * 0.06,
        width: width,
        decoration: BoxDecoration(
          color: isPrimary! ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isPrimary! ? Colors.transparent : primaryColor,
          ),
        ),
        child: iconData != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData!,
                    color: isPrimary! ? secondaryColor : primaryColor,
                  ),
                  SizedBox(width: 10),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      text,
                      style: newTextStyle ??
                          Theme.of(context).textTheme.titleMedium!.apply(
                                color: isPrimary! ? Colors.white : primaryColor,
                                fontWeightDelta: 2,
                                fontSizeFactor: 1.2,
                              ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  text,
                  style: newTextStyle ??
                      Theme.of(context).textTheme.titleMedium!.apply(
                            color: isPrimary! ? Colors.white : primaryColor,
                            fontWeightDelta: 2,
                            fontSizeFactor: 1.2,
                          ),
                ),
              ),
      ),
    );
  }
}
