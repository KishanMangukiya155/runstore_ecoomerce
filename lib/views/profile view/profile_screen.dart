import 'package:runstore_ecoomerce/controller/signIn_controller.dart';
import 'package:runstore_ecoomerce/libraries.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final signInController = Get.find<SignInController>();
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
              signInController.signOutUser();
            },
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: Column(
        children: [
          SizedBox(height: AppSizes.defaultHeight / 1.2),

          // "User Profile" Container
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultHorizontalPadding,
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.defaultVerticalPadding,
              horizontal: AppSizes.defaultHorizontalPadding,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomListTile(
              changeLeadingWidget: true,
              leadingWidget: Padding(
                padding:
                    EdgeInsets.only(right: AppSizes.defaultHorizontalPadding),
                child: CircleAvatar(
                  radius: AppSizes.height * 0.045,
                  backgroundImage: AssetImage(AppImages.profile_pic),
                  backgroundColor: Colors.grey,
                ),
              ),
              title: "Vishal Rajpara",
              subTitle: "+91 9878451285",
              newTrailingWidget: IconButton(
                onPressed: () {},
                icon: Icon(
                  PhosphorIcons.note_pencil,
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSizes.defaultHeight / 1.2),

          // Profile options list
          ListView.separated(
            itemCount: profileOptions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.defaultHorizontalPadding,
            ),
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
