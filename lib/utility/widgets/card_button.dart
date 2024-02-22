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
        // overlayColor: MaterialStateProperty.all(
        //   Theme.of(context).colorScheme.onBackground,
        // ),
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            // color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor),
            boxShadow: Theme.of(context).brightness == Brightness.light
                ? [
                    applyShadow!
                        ? BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.0,
                          )
                        : BoxShadow(),
                  ]
                : [],
          ),
          child: Icon(
            iconData,
            color: Colors.black,

            // color: applyShadow!
            //     ? Theme.of(context).brightness == Brightness.light
            //         ? Colors.black
            //         : secondaryColor
            //     : Theme.of(context).brightness == Brightness.light
            //         ? primaryColor
            //         : secondaryColor,
          ),
        ),
      ),
    );
  }
}
