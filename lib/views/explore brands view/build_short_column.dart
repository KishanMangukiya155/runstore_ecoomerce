import 'package:runstore_ecoomerce/libraries.dart';

Column buildShortColumn({
  required BuildContext context,
  required IconData iconData,
  required num count,
  required String label,
}) {
  return Column(
    children: [
      Icon(
        iconData,
        size: AppSizes.height * 0.04,
        color: primaryColor,
      ),
      Text(
        count.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.apply(
              fontWeightDelta: -2,
              color: Colors.grey,
            ),
      ),
    ],
  );
}
