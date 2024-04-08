import 'package:runstore_ecoomerce/libraries.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutController = Get.find<CheckOutController>();
    return Column(
      children: [
        SizedBox(height: AppSizes.formVerticalSpace),

        // A horizontal list that displays the payment methods
        SizedBox(
          height: AppSizes.height * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: checkOutController.paymentMethod.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return InkWell(
                  onTap: () {
                    checkOutController.setPaymentIndex(index);
                  },
                  splashColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: index == 0
                            ? AppSizes.defaultHorizontalPadding * 1.6
                            : 0,
                        right: AppSizes.defaultHorizontalPadding),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: AppSizes.height * 0.005,
                      color: Colors.white,
                      shadowColor:
                          checkOutController.paymentIndex.value == index
                              ? primaryColor
                              : Colors.transparent,
                      child: Container(
                        height: AppSizes.height * 0.12,
                        width: AppSizes.width * 0.38,
                        padding: index == 0
                            ? EdgeInsets.all(10)
                            : EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                checkOutController.paymentIndex.value == index
                                    ? Colors.transparent
                                    : primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image(
                          image: checkOutController.paymentMethod[index],
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),

        SizedBox(height: AppSizes.extraVerticalPadding * 2),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.extraHorizontalPadding * 1.6),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  initialValue: "**** **** **** 3208",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: primaryColor, fontSizeFactor: 1.2),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Card number",
                  ),
                ),
                SizedBox(height: AppSizes.formVerticalSpace),
                TextFormField(
                  initialValue: "Jasmine Hampton",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: primaryColor, fontSizeFactor: 1.2),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Cardholder name",
                  ),
                ),
                SizedBox(height: AppSizes.formVerticalSpace),
                Row(
                  children: [
                    SizedBox(
                      width: AppSizes.width / 2.5,
                      child: TextFormField(
                        initialValue: "07/25",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: primaryColor, fontSizeFactor: 1.2),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Expiry Date"),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: AppSizes.width / 2.5,
                      child: TextFormField(
                        initialValue: "2856",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: primaryColor, fontSizeFactor: 1.2),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("cvv"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.formVerticalSpace),
                Obx(() {
                  return SwitchListTileWidget(
                    titleText: "Save credit card information",
                    switchValue: checkOutController.saveCreditCardDetails.value,
                    onChanged: (value) {
                      checkOutController.saveCreditCardDetails(value);
                    },
                  );
                }),
                SizedBox(height: AppSizes.formVerticalSpace),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
