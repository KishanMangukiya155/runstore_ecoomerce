import 'package:runstore_ecoomerce/libraries.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileOptions = [
      {
        "leading": Icons.notifications_none,
        "title": "Notifications",
        "onTap": () {
          Get.to(() => NotificationScreen());
        },
      },
      {
        "leading": Icons.receipt,
        "title": "My orders",
        "onTap": () {
          Get.to(() => MyOrderScreen());
        },
      },
      {
        "leading": Icons.near_me_outlined,
        "title": "Addresses",
        "onTap": () {},
      },
      {
        "leading": Icons.payment,
        "title": "Payment",
        "onTap": () {},
      },
      {
        "leading": Icons.favorite_outline,
        "title": "Wishlist",
        "onTap": () {},
      },
      {
        "leading": PhosphorIcons.sliders,
        "title": "Settings",
        "onTap": () {},
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Profile",
          applyLeading: true,
          actionCardButton: CardButton(
            iconData: Icons.more_horiz,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Column(
        children: [
          SizedBox(height: AppSizes.defaultHeight / 1.2),

          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.profile_pic),
            backgroundColor: primaryColor.withOpacity(0.5),
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // Username
          Text(
            "Vishal Rajpara",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(fontSizeFactor: 2.5),
          ),
          SizedBox(height: AppSizes.defaultHeight * 1.6),

          // Profile options list
          ListView.separated(
            itemCount: profileOptions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.minorHorizontalPadding),
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  profileOptions[index]["leading"],
                  color: Theme.of(context).brightness == Brightness.light
                      ? primaryColor
                      : secondaryColor,
                ),
                title: Text(
                  "${profileOptions[index]["title"]}",
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                        fontSizeFactor: 1.4,
                        fontWeightDelta: 1,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : secondaryColor,
                      ),
                ),
                trailing: CardButton(
                  iconData: Icons.arrow_forward,
                  onTap: profileOptions[index]["onTap"],
                  applyShadow: false,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
          )
        ],
      ),
    );
  }
}
