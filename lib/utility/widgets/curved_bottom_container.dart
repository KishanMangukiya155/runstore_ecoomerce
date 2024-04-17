import 'package:runstore_ecoomerce/libraries.dart';

class BottomSheetContainer extends StatelessWidget {
  BottomSheetContainer({
    super.key,
    required this.height,
    this.applyFormPadding = true,
    this.isAppIconCenter = true,
    this.appIconPositionFromLeft,
    required this.childWidget,
  });

  final double height;
  final bool? applyFormPadding;
  final bool? isAppIconCenter;
  final double? appIconPositionFromLeft;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height,
          width: AppSizes.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.defaultHorizontalPadding * 2.4,
          ),
          child: childWidget,
        ),
        Positioned(
          top: AppSizes.height * -0.12,
          left: isAppIconCenter!
              ? AppSizes.width / 2.65
              : appIconPositionFromLeft,
          child: app_icon(),
        ),
      ],
    );
  }
}
