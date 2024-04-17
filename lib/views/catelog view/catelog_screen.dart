import 'package:runstore_ecoomerce/libraries.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final catalogController = Get.find<CatalogController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Catalog",
          leadingCardButton: false,
          actionCardButton: CardButton(
            iconData: Icons.search,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.extraHorizontalPadding,
          vertical: AppSizes.defaultVerticalPadding,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          // Banners List
          if (catalogController.bannersList.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: catalogController.bannersList.length,
              itemBuilder: (context, index) {
                final banner = catalogController.bannersList[index];
                return Container(
                  height: AppSizes.height * 0.25,
                  decoration: BoxDecoration(
                    color: banner.bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.width * 0.04,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Banner Details
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.extraVerticalPadding * 1.3,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Customer Type
                            Text(
                              banner.customerType ?? "",
                              style:
                                  Theme.of(context).textTheme.titleLarge!.apply(
                                        fontSizeFactor: 1.3,
                                        fontWeightDelta: 1,
                                        color: banner.customerTypeTextColor,
                                      ),
                            ),

                            // Customer Type's total products
                            Text(
                              "${banner.totalProducts.toString()}k products",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    fontWeightDelta: -2,
                                  ),
                            ),

                            Spacer(),

                            // "View All" button
                            FilledButton(
                              onPressed: () {},
                              child: Text("View all"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    banner.buttonColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        banner.image,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight);
              },
            ),
          ],
          SizedBox(height: AppSizes.defaultVerticalPadding),

          // Advertisement banner
          if (catalogController.advertisements.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: catalogController.advertisements.length,
              itemBuilder: (context, index) {
                final advertisement = catalogController.advertisements[index];
                return AdvertisementBanner(
                  advertisement: advertisement,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight);
              },
            ),
          ],
          SizedBox(height: AppSizes.defaultVerticalPadding),

          // Catalog options
          if (catalogController.catalogOptions.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: catalogController.catalogOptions.length,
              itemBuilder: (context, index) {
                return catalogController.catalogOptions[index];
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSizes.defaultHeight / 1.5);
              },
            ),
          ],
        ],
      ),
    );
  }
}
