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
        "onTap": () {
          Get.to(() => AddressesScreen());
        },
      },
      {
        "leading": Icons.payment,
        "title": "Payment",
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
          leadingCardButton: false,
          actionCardButton: CardButton(
            iconData: Icons.logout,
            onTap: () {
              Get.offAll(() => LoginScreen());
            },
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Column(
        children: [
          SizedBox(height: AppSizes.defaultHeight / 1.2),

          // Profile Picture
          CircleAvatar(
            radius: AppSizes.height * 0.08,
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
                .apply(fontSizeFactor: 2.5, fontWeightDelta: -2),
          ),
          SizedBox(
            height: AppSizes.height * 0.04,
          ),

          // Profile options list
          ListView.separated(
            itemCount: profileOptions.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.minorHorizontalPadding),
            itemBuilder: (context, index) {
              return CustomListTile(
                leadingIconData: profileOptions[index]["leading"],
                title: profileOptions[index]["title"],
                onPressed: profileOptions[index]["onTap"],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.height * 0.02);
            },
          )
        ],
      ),
    );
  }
}
