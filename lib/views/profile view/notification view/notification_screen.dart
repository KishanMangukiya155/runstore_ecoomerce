import 'package:runstore_ecoomerce/libraries.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notifications = [
      {
        "notification_icon": PhosphorIcons.receipt,
        "notification_title": "Order#882610",
        "notification_time": "1 min ago",
        "notification_brief": "Your order has been confirmed",
      },
      {
        "notification_icon": PhosphorIcons.gift_thin,
        "notification_title": "Happy Birthday! 30% Off",
        "notification_time": "Today at 06:00",
        "notification_brief": "Get a special gift on your birthday!",
      },
      {
        "notification_icon": PhosphorIcons.receipt,
        "notification_title": "Order#243188",
        "notification_time": "Yesterday at 12:59",
        "notification_brief": "Your order has been shipped",
      },
      {
        "notification_icon": PhosphorIcons.percent,
        "notification_title": "Last chance to save 60%",
        "notification_time": "Yesterday at 12:05",
        "notification_brief": "Don't miss intro price!",
      },
      {
        "notification_icon": PhosphorIcons.percent,
        "notification_title": "Special offer for you",
        "notification_time": "14 March at 09:46",
        "notification_brief": "Most popular speaker - 25% off",
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Notification",
          actionCardButton: CardButton(
            iconData: PhosphorIcons.dots_three,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: AppSizes.extraVerticalPadding * 2),
        itemBuilder: (context, index) {
          return Container(
            height: AppSizes.height * 0.12,
            width: AppSizes.width,
            // decoration: BoxDecoration(
            //   color: primaryColor.withOpacity(0.3),
            //   borderRadius: BorderRadius.circular(15),
            // ),
            margin: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultHorizontalPadding),
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppSizes.height * 0.08,
                  width: AppSizes.width * 0.15,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    notifications[index]["notification_icon"],
                    color: primaryColor,
                  ),
                ),
                SizedBox(width: AppSizes.defaultWidth * 3.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index]["notification_title"],
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(fontSizeFactor: 1.1),
                      ),
                      Text(
                        notifications[index]["notification_time"],
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                              color: Colors.grey,
                              fontSizeFactor: 1.2,
                            ),
                      ),
                      Spacer(),
                      Text(
                        notifications[index]["notification_brief"],
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .apply(color: Colors.grey, fontWeightDelta: -15),
                      ),
                    ],
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
