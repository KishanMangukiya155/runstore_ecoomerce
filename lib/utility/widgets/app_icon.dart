import 'package:runstore_ecoomerce/libraries.dart';

class app_icon extends StatelessWidget {
  const app_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.height * 0.26,
      width: AppSizes.width * 0.26,
      decoration: BoxDecoration(
        color: secondaryColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1.3),
      ),
    );
  }
}
