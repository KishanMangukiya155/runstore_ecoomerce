import 'package:runstore_ecoomerce/libraries.dart';

class ExploreBrandsScreen extends StatelessWidget {
  const ExploreBrandsScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final brandController = Get.find<BrandsController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: brand.name,
          leadingCardButton: true,
          actionCardButton: CardButton(
            iconData: Icons.search,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(
          AppSizes.appBarPreferredSize,
        ),
      ),
      body: Column(
        children: [
          // Image
          SizedBox(
            height: AppSizes.height * 0.2,
            width: AppSizes.width * 0.5,
            child: Image.asset(
              brand.image,
              fit: BoxFit.contain,
            ),
          ),

          // Followers, Items and Reviews
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Followers
              buildShortColumn(
                context: context,
                iconData: PhosphorIcons.heart,
                count: 736,
                label: "Followers",
              ),
              buildShortColumn(
                context: context,
                iconData: PhosphorIcons.t_shirt,
                count: 894,
                label: "Items",
              ),
              buildShortColumn(
                context: context,
                iconData: PhosphorIcons.star,
                count: 372,
                label: "Reviews",
              ),
            ],
          ),
          SizedBox(height: AppSizes.extraDefaultHeight),

          // "Add to favorites" button
          PrimaryButton(
            iconData: Icons.add,
            text: "Add to favorites",
            width: AppSizes.width - (AppSizes.extraHorizontalPadding * 5),
            onTap: () {},
          ),
          SizedBox(height: AppSizes.extraDefaultHeight),

          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultHorizontalPadding,
            ),
            itemCount: brandController.brandsOptions.length,
            itemBuilder: (context, index) {
              return brandController.brandsOptions[index];
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.defaultHeight);
            },
          ),
        ],
      ),
    );
  }
}
