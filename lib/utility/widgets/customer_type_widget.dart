import 'package:runstore_ecoomerce/libraries.dart';

class CustomerTypeWidget extends StatelessWidget {
  const CustomerTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(() {
      return SegmentedButton(
        segments: [
          ButtonSegment(
            value: CustomerTypes.All,
            label: Text("All"),
          ),
          ButtonSegment(
            value: CustomerTypes.Men,
            label: Text("Men"),
          ),
          ButtonSegment(
            value: CustomerTypes.Women,
            label: Text("Women"),
          ),
          ButtonSegment(
            value: CustomerTypes.Kids,
            label: Text("Kids"),
            enabled: true,
          ),
        ],
        showSelectedIcon: false,
        style: buildSegmentedButtonStyle(),
        selected: <CustomerTypes>{homeController.customerTypes!.value},
        onSelectionChanged: (value) {
          homeController.customerTypes!(value.first);
        },
      );
    });
  }

  ButtonStyle buildSegmentedButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return Colors.transparent;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return Colors.black54;
        },
      ),
      side: MaterialStatePropertyAll(
        BorderSide(
          color: Colors.black54,
          width: AppSizes.height * 0.0005,
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity(vertical: -1),
    );
  }
}
