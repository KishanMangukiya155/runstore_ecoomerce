import 'package:runstore_ecoomerce/libraries.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final checkOutController = Get.find<CheckOutController>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.extraHorizontalPadding * 1.6),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: AppSizes.formVerticalSpace),
            TextFormField(
              initialValue: "Home#1",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: primaryColor, fontSizeFactor: 1.2),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Name",
              ),
            ),
            SizedBox(height: AppSizes.formVerticalSpace),
            TextFormField(
              initialValue: "438, Dark Spurt Avenue",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: primaryColor, fontSizeFactor: 1.2),
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("Address"),
              ),
            ),
            SizedBox(height: AppSizes.formVerticalSpace),
            Row(
              children: [
                SizedBox(
                  width: AppSizes.width / 2.5,
                  child: TextFormField(
                    initialValue: "San Fransisco",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: primaryColor, fontSizeFactor: 1.2),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text("City"),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: AppSizes.width / 2.5,
                  child: TextFormField(
                    initialValue: "94528",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: primaryColor, fontSizeFactor: 1.2),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text("Zip Code"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.formVerticalSpace),
            TextFormField(
              initialValue: "California",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: primaryColor, fontSizeFactor: 1.2),
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("State"),
              ),
            ),
            SizedBox(height: AppSizes.formVerticalSpace),
            TextFormField(
              initialValue: "+1 (415) 578-8033",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(color: primaryColor, fontSizeFactor: 1.2),
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text("Phone number"),
              ),
            ),
            SizedBox(height: AppSizes.defaultHeight),
            Obx(() {
              return SwitchListTileWidget(
                titleText: 'Set Shipping address default',
                switchValue: checkOutController.setDefaultAddress.value,
                onChanged: (value) {
                  checkOutController.setDefaultAddress(value);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
