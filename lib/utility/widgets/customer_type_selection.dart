import 'package:runstore_ecoomerce/libraries.dart';

class CustomerTypeSelectionWidget extends StatelessWidget {
  const CustomerTypeSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        homeController.customerTypeList.length,
        (index) {
          final customerType = homeController.customerTypeList[index];
          return Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultWidth * 2,
                vertical: AppSizes.defaultHeight / 2,
              ),
              child: InkWell(
                onTap: () {
                  homeController.customerType(index);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: index == homeController.customerType.value
                    ? Card(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.black12),
                        ),
                        color: primaryColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 20.0,
                          ),
                          child: Center(
                            child: Text(
                              customerType,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    fontWeightDelta: -1,
                                    fontSizeFactor: 1.1,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      )
                    : Text(customerType),
              ),
            );
          });
        },
      ),
    );
  }
}
