import 'package:runstore_ecoomerce/libraries.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutController = Get.find<CheckOutController>();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.extraHorizontalPadding * 1.6),
      child: Column(
        children: [
          SizedBox(height: AppSizes.formVerticalSpace),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: checkOutController.deliveryOptions.length,
            itemBuilder: (context, index) {
              final delivery = checkOutController.deliveryOptions[index];
              return Obx(() {
                return InkWell(
                  onTap: () {
                    checkOutController.setDeliveryIndex(index);
                  },
                  child: Container(
                    height: AppSizes.height * 0.14,
                    width: AppSizes.width - (AppSizes.extraDefaultWidth * 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: checkOutController.deliveryIndex.value == index
                            ? Colors.transparent
                            : primaryColor,
                      ),
                      boxShadow: [
                        checkOutController.deliveryIndex.value == index
                            ? applyBoxShadow()
                            : BoxShadow(),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: AppSizes.width * 0.12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              delivery["type"],
                              style:
                                  Theme.of(context).textTheme.titleLarge!.apply(
                                        color: checkOutController
                                                    .deliveryIndex.value ==
                                                index
                                            ? Colors.black
                                            : primaryColor,
                                      ),
                            ),
                            Text(
                              delivery["expected_delivery"],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    fontWeightDelta: -10,
                                    color: checkOutController
                                                .deliveryIndex.value ==
                                            index
                                        ? Colors.black
                                        : primaryColor,
                                  ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.done,
                          size: AppSizes.height * 0.04,
                          color: checkOutController.deliveryIndex.value == index
                              ? Colors.green
                              : Colors.black26,
                        ),
                        SizedBox(width: AppSizes.width * 0.1),
                      ],
                    ),
                  ),
                );
              });
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.extraDefaultHeight);
            },
          ),
          SizedBox(height: AppSizes.defaultHeight / 1.1),
          Text(
            AppStrings.freeShipping,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.apply(
                  fontSizeFactor: 1.2,
                  color: Colors.black45,
                ),
          ),
        ],
      ),
    );
  }
}
