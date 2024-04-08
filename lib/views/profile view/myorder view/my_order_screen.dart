import 'package:runstore_ecoomerce/libraries.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> myOrders = [
      // 0 for cancel
      // 1 for onTheWay
      // 2 for delivered
      {
        "shipping": 1,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
      {
        "shipping": 0,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
      {
        "shipping": 1,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
      {
        "shipping": 2,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
      {
        "shipping": 2,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
      {
        "shipping": 2,
        "orderId": "#890012",
        "date": "9 April",
        "items": 3,
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "My Orders",
          actionCardButton: CardButton(
            iconData: PhosphorIcons.dots_three,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView.separated(
        itemCount: myOrders.length,
        physics: BouncingScrollPhysics(),
        padding:
            EdgeInsets.symmetric(vertical: AppSizes.extraVerticalPadding * 1.5),
        itemBuilder: (context, index) {
          final orders = myOrders[index];
          return Container(
            height: AppSizes.height * 0.12,
            width: AppSizes.width,
            margin: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultHorizontalPadding),
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: AppSizes.height * 0.08,
                  width: AppSizes.width * 0.15,
                  decoration: BoxDecoration(
                    color: orders["shipping"] == 0
                        ? Colors.red.shade100
                        : orders["shipping"] == 1
                            ? Colors.yellow.shade100
                            : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.only(right: AppSizes.defaultWidth * 3),
                  child: Icon(
                    orders["shipping"] == 0
                        ? Icons.close
                        : orders["shipping"] == 1
                            ? Icons.local_shipping_outlined
                            : Icons.done,
                    color: orders["shipping"] == 0
                        ? Colors.redAccent
                        : orders["shipping"] == 1
                            ? Colors.deepOrange.shade300
                            : Colors.green.shade500,
                  ),
                ),
                SizedBox(
                  width: AppSizes.defaultWidth * 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Happy Birthday! 30% Off",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeFactor: 1.1),
                      ),
                      Text(
                        "Today at 6:00",
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                              color: Colors.grey,
                              fontSizeFactor: 1.2,
                            ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: AppSizes.defaultHeight * 2,
                  decoration: BoxDecoration(
                    color: orders["shipping"] == 0
                        ? Colors.red.shade100
                        : orders["shipping"] == 1
                            ? Colors.yellow.shade100
                            : Colors.green.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    orders["shipping"] == 0
                        ? "Cancel"
                        : orders["shipping"] == 1
                            ? "Shipped"
                            : "Delivered",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(fontSizeFactor: 1.2, color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppSizes.extraDefaultHeight * 1.2);
        },
      ),
    );
  }
}
