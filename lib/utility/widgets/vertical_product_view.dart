import 'package:runstore_ecoomerce/libraries.dart';

class VerticalProductView extends StatelessWidget {
  const VerticalProductView({
    super.key,
    this.image,
    this.title,
    this.subTitle,
    this.discountPrice,
    this.actualPrice,
    required this.productModel,
  });

  final ProductModel productModel;

  final String? image;
  final String? title;
  final String? subTitle;
  final double? discountPrice;
  final double? actualPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppSizes.height * 0.25,
          width: AppSizes.width * 0.4,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(productModel.product_image),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: AppSizes.height * 0.01),

        // Product name
        Text(
          productModel.product_name,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.titleMedium!.apply(
                fontWeightDelta: -1,
                fontSizeFactor: 1.3,
              ),
        ),
        SizedBox(height: AppSizes.height * 0.005),

        // Product brief
        Text(
          subTitle ?? "Regular Fit Hoodie",
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.titleMedium!.apply(
                fontWeightDelta: -3,
                fontSizeFactor: 1,
              ),
        ),
        SizedBox(height: AppSizes.height * 0.005),

        // Discount price and actual price
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: " \$${productModel.product_price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      color: primaryColor,
                      fontWeightDelta: -2,
                    ),
              ),
              TextSpan(text: "    "),
              TextSpan(
                text: "\$${actualPrice?.toStringAsFixed(2) ?? "24.99"}",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeightDelta: -2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
