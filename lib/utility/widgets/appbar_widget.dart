import 'package:runstore_ecoomerce/libraries.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    this.applyLeading = true,
    this.leadingCardButton = true,
    required this.actionCardButton,
  });

  final String title;
  final bool? applyLeading;
  final bool? leadingCardButton;
  final CardButton actionCardButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xffF9FAFB),
      // backgroundColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // style: Theme.of(context).textTheme.titleMedium!.apply(
        //       color: Theme.of(context).colorScheme.brightness == Brightness.dark
        //           ? secondaryColor
        //           : Colors.black,
        //       fontSizeFactor: 1.2,
        //     ),
      ),
      centerTitle: true,
      leading: applyLeading!
          ? Padding(
              padding:
                  EdgeInsets.only(left: AppSizes.defaultHorizontalPadding / 2),
              child: leadingCardButton!
                  ? CardButton(
                      iconData: Icons.arrow_back,
                      onTap: () {
                        Get.back();
                      },
                    )
                  : SizedBox(),
            )
          : SizedBox(),
      leadingWidth:
          applyLeading! ? AppSizes.defaultHorizontalPadding * 4.5 : 0.0,
      actions: [
        actionCardButton,
        SizedBox(width: AppSizes.defaultWidth * 1.8),
      ],
    );
  }
}
