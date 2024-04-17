import 'package:get_storage/get_storage.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final get = GetStorage();
    // print("${get.read("email")} ${get.read("password")}");
    AppSizes.onInit(context);
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
                CustomBottomSheet(
                  height: AppSizes.height * 0.23,
                  childWidget: Column(
                    children: [],
                  ),
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
          top: AppSizes.defaultVerticalPadding,
          bottom: AppSizes.defaultVerticalPadding * 2,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          // Customer type selection
          CustomerTypeWidget(),

          SizedBox(height: AppSizes.defaultHeight),

          // Banners List
          if (homeController.banner.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              itemCount: homeController.banner.length,
              physics: NeverScrollableScrollPhysics(),
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
            newTrailingWidget: TextButton(
              onPressed: () {},
              child: Text("View all"),
            ),
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
                  index: index,
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
                  index: index,
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
            newTrailingWidget: TextButton(
              onPressed: () {},
              child: Text("View all"),
            ),
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
                  index: index,
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
