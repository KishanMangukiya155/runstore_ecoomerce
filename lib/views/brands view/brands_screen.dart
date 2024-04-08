import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandsController = Get.find<BrandsController>();
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Brands",
          leadingCardButton: true,
          actionCardButton: CardButton(
            iconData: Icons.search,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: brandsController.brands.length,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultHorizontalPadding,
          vertical: AppSizes.defaultVerticalPadding,
        ),
        itemBuilder: (context, index) {
          final brands = brandsController.brands[index];
          return InkWell(
            onTap: () {
              Get.to(() => ExploreBrandsScreen(brand: brands));
            },
            highlightColor: Colors.transparent,
            child: Container(
              width: AppSizes.width,
              height: AppSizes.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image
                  SizedBox(
                    width: AppSizes.width * 0.3,
                    child: Image.asset(brands.image),
                  ),

                  // Name and ratings
                  SizedBox(
                    width: AppSizes.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          brands.name,
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                fontWeightDelta: 2,
                              ),
                        ),
                        RatingBar.builder(
                          itemSize: AppSizes.height * 0.04,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          initialRating: brands.ratings.toDouble(),
                          itemBuilder: (context, index) {
                            return Icon(
                              Icons.star_rate_rounded,
                              color: primaryColor,
                            );
                          },
                          onRatingUpdate: (value) {},
                        ),
                        Text(
                          brands.ratings.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.defaultHeight);
        },
      ),
    );
  }
}
