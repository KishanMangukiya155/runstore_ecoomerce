import 'package:runstore_ecoomerce/libraries.dart';
import 'package:runstore_ecoomerce/views/root/test_package.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rootController = Get.find<RootController>();
    return Obx(() {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SizedBox(
          height: AppSizes.height,
          child: rootController
              .navigationWidget[rootController.navigationIndex.value],
        ),
        bottomNavigationBar: Container(
          height: AppSizes.height * 0.08,
          child: TestPackage(),
        ),
      );
    });
  }
}
