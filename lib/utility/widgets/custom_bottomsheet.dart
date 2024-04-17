import 'package:runstore_ecoomerce/libraries.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.height,
    required this.childWidget,
  });

  final double height;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: childWidget,
        );
      },
    );
  }
}
