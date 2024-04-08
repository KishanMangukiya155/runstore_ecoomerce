import 'libraries.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> profileOptions = [
      {
        "leading": Icons.people_outline_rounded,
        "title": "My profile",
        "onTap": () {},
      },
      {
        "leading": Icons.language,
        "title": "Language",
        "onTap": () {},
      },
      {
        "leading": Icons.notifications,
        "title": "Notification",
        "onTap": () {
          ;
        },
      },
      {
        "leading": Icons.help,
        "title": "About us",
        "onTap": () {},
      },
      {
        "leading": Icons.help,
        "title": "Help",
        "onTap": () {},
      },
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: AppSizes.defaultHeight / 1.2),

          // Profile Picture
          CircleAvatar(
            radius: AppSizes.height * 0.08,
            // backgroundImage: AssetImage(AppImages.profile_pic),
            backgroundColor: primaryColor.withOpacity(0.5),
          ),
          SizedBox(height: AppSizes.defaultHeight),

          // Username
          Text(
            "Jenny Wilson",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(fontSizeFactor: 2.5, fontWeightDelta: -2),
          ),
          Text(
            "Jenny Wilson",
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
