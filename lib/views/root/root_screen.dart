import 'package:runstore_ecoomerce/libraries.dart';

import 'bottomar_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Obx(
        () => Stack(
          children: [
            // Accessing/Displaying page according to the navigationIndex
            rootController
                .navigationList[rootController.navigationIndex.toInt()]["page"],

            // Bottom Navigation bar
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
