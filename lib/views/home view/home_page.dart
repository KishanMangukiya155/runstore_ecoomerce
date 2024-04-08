import 'package:runstore_ecoomerce/libraries.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Hi, Vishal",
          leadingCardButton: false,
          actionCardButton: CardButton(
            iconData: Icons.filter_alt_outlined,
            onTap: () {
              Get.bottomSheet(
                BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                      height: AppSizes.height * 0.5,
                      color: Colors.grey.shade50,
                    );
                  },
                ),
              );
            },
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: AppSizes.defaultHorizontalPadding,
          right: AppSizes.defaultHorizontalPadding,
          top: AppSizes.defaultVerticalPadding / 5,
          bottom: AppSizes.defaultVerticalPadding * 2,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          // Customer type selection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                              shadowColor: primaryColor.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.black12),
                              ),
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
                                          fontSizeFactor: 1,
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
          ),
          SizedBox(height: AppSizes.defaultHeight / 2),

          // Banners List
          if (homeController.banner.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              itemCount: homeController.banner.length,
              itemBuilder: (context, index) {
                final banner = homeController.banner[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    banner.image,
                    height: AppSizes.height * 0.25,
                    width: AppSizes.width * 0.9,
                    fit: BoxFit.cover,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox();
              },
            ),
          ],
          SizedBox(height: AppSizes.defaultHeight),

          // New Arrivals
          CustomListTile(
            leadingIconData: PhosphorIcons.fire,
            title: "New Arrivals",
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // GridView of Product
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.defaultHorizontalPadding / 2,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: homeController.allProducts.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                childAspectRatio: 2.2 / 4,
              ),
              itemBuilder: (context, index) {
                return VerticalProductView(
                  productModel: homeController.allProducts[index],
                );
              },
            ),
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // Advertisements list
          if (homeController.advertisements.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeController.advertisements.length,
              itemBuilder: (context, index) {
                final advertisement = homeController.advertisements[index];
                return AdvertisementBanner(advertisement: advertisement);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight);
              },
            ),
          ],
          SizedBox(height: AppSizes.defaultHeight),

          // GridView of Product
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.defaultHorizontalPadding / 2,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: homeController.allProducts.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                childAspectRatio: 2.2 / 4,
              ),
              itemBuilder: (context, index) {
                return VerticalProductView(
                  productModel: homeController.allProducts[index],
                );
              },
            ),
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // Most Popular
          CustomListTile(
            leadingIconData: PhosphorIcons.star,
            title: "Most Popular",
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // GridView of Product
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.defaultHorizontalPadding / 2,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: homeController.allProducts.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2.2 / 4,
              ),
              itemBuilder: (context, index) {
                return VerticalProductView(
                  productModel: homeController.allProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
