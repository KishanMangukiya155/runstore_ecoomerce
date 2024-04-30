import 'package:runstore_ecoomerce/libraries.dart';
import 'package:runstore_ecoomerce/repository/models/usermodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final signInController = Get.find<SignInController>();
    final userRepository = Get.find<UserRepository>();
    final rootController = Get.find<RootController>();
    final profileController = Get.find<ProfileController>();
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
              rootController.setNavigationIndex(0);
              signInController.signOutUser();
            },
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: FutureBuilder(
        future: userRepository.fetchUserDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final UserModel userData = snapshot.data as UserModel;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: AppSizes.defaultHeight / 1.2),

                    // User profile container
                    buildUserProfileContainer(userData),
                    SizedBox(height: AppSizes.defaultHeight / 1.2),

                    // Profile options list
                    buildUserProfileOptionsListView(profileOptions),
                    SizedBox(height: AppSizes.defaultHeight / 1.2),
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.red),
                        side: MaterialStatePropertyAll(
                          BorderSide(color: Colors.red),
                        ),
                      ),
                      onPressed: () {
                        buildConfirmDeleteDialog(context, profileController);
                      },
                      child: Text("Delete Account"),
                    ),
                  ],
                ),
              );
            } else {
              return Text(snapshot.error.toString());
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> buildConfirmDeleteDialog(
      BuildContext context, ProfileController profileController) {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              // Buttons
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: "Cancel",
                      width: AppSizes.width,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: AppSizes.extraDefaultWidth * 2),
                  Expanded(
                    child: PrimaryButton(
                      text: "Delete",
                      width: AppSizes.width,
                      onTap: () {
                        Navigator.pop(context);
                        profileController.deleteUser(
                          profileController.emailController.text.trim(),
                          profileController.passwordController.text.trim(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
            contentPadding: EdgeInsets.all(25),
            surfaceTintColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(vertical: 200, horizontal: 10),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: profileController.reAuthenticateFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email field
                    TextFormField(
                      controller: profileController.emailController,
                      validator: (value) => Validations.validateEmail(
                          email: profileController.emailController.text),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultHorizontalPadding,
                          vertical: AppSizes.defaultVerticalPadding * 1.1,
                        ),
                        prefixIcon: Icon(
                          PhosphorIcons.envelope_bold,
                          color: primaryColor,
                          size: AppSizes.formIconHeight,
                        ),
                        labelText: "Email Address",
                        hintText: "Email Address",
                      ),
                    ),
                    SizedBox(height: AppSizes.defaultHeight),

                    // Password field
                    Obx(() {
                      return TextFormField(
                        controller: profileController.passwordController,
                        obscureText: profileController.obscureText.value,
                        validator: (value) => Validations.validatePassword(
                            password:
                                profileController.passwordController.text),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black54,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSizes.defaultHorizontalPadding,
                            vertical: AppSizes.defaultVerticalPadding * 1.1,
                          ),
                          prefixIcon: Icon(
                            PhosphorIcons.lock_bold,
                            color: primaryColor,
                            size: AppSizes.formIconHeight,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              profileController.obscureText(
                                  !profileController.obscureText.value);
                            },
                            icon: Icon(
                              profileController.obscureText.isTrue
                                  ? PhosphorIcons.eye_closed_bold
                                  : PhosphorIcons.eye_bold,
                              color: primaryColor.withOpacity(0.5),
                            ),
                          ),
                          labelText: "Password",
                          hintText: "Password",
                        ),
                      );
                    }),
                    SizedBox(height: AppSizes.defaultHeight),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ListView buildUserProfileOptionsListView(
      List<Map<String, dynamic>> profileOptions) {
    return ListView.separated(
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
    );
  }

  // UserProfile Container
  Container buildUserProfileContainer(UserModel userData) {
    return Container(
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
          padding: EdgeInsets.only(right: AppSizes.defaultHorizontalPadding),
          child: CircleAvatar(
            radius: AppSizes.height * 0.045,
            backgroundImage: userData.imageUrl.isNotEmpty
                ? NetworkImage(userData.imageUrl)
                : NetworkImage(AppImages.network_Profile_pic),
            backgroundColor: Colors.grey,
          ),
        ),
        title: userData.fullName,
        subTitle: userData.email,
        newTrailingWidget: IconButton(
          onPressed: () {
            Get.to(() => UpdateUserProfile());
          },
          icon: Icon(
            PhosphorIcons.note_pencil,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
