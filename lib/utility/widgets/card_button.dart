import 'package:runstore_ecoomerce/libraries.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.applyShadow = true,
  });

  final IconData iconData;
  final void Function() onTap;
  final bool? applyShadow;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        overlayColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.onBackground,
        ),
        child: Container(
          height: AppSizes.height * 0.06,
          width: AppSizes.width * 0.12,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: applyShadow!
                  ? Theme.of(context).brightness == Brightness.light
                      ? Colors.transparent
                      : secondaryColor
                  : Theme.of(context).brightness == Brightness.light
                      ? primaryColor
                      : secondaryColor,
            ),
            boxShadow: Theme.of(context).brightness == Brightness.light
                ? [
                    applyShadow! ? applyBoxShadow() : BoxShadow(),
                  ]
                : [],
          ),
          child: Icon(
            iconData,
            color: applyShadow!
                ? Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : secondaryColor
                : Theme.of(context).brightness == Brightness.light
                    ? primaryColor
                    : secondaryColor,
          ),
        ),
      ),
    );
  }
}
