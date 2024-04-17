import 'package:runstore_ecoomerce/libraries.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black12,
      thickness: AppSizes.height * 0.0016,
      height: AppSizes.extraDefaultHeight * 1.5,
    );
  }
}
