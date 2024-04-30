import 'package:runstore_ecoomerce/libraries.dart';
import 'package:runstore_ecoomerce/repository/models/usermodel.dart';

class UpdateUserProfile extends StatelessWidget {
  const UpdateUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    final userRepository = Get.find<UserRepository>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
        child: AppbarWidget(
          title: "Update Profile",
          leadingCardButton: false,
        ),
      ),
      body: FutureBuilder(
        future: userRepository.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final userData = snapshot.data;
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.extraHorizontalPadding * 1.5),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppSizes.formVerticalSpace * 3),

                      // Profile Picture
                      buildProfilePictureWidget(context, userData!),
                      SizedBox(height: AppSizes.formVerticalSpace * 1.7),

                      // Full name field
                      TextFormField(
                        controller: profileController.updateFullNameController,
                        validator: (value) {
                          return Validations.emptyField("FullName", value);
                        },
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
                            PhosphorIcons.user_bold,
                            color: primaryColor,
                          ),
                          labelText: "Full name",
                          hintText: "Full name",
                        ),
                      ),
                      SizedBox(height: AppSizes.formVerticalSpace * 1.7),

                      // Email field
                      TextFormField(
                        controller: profileController.updateEmailController,
                        validator: (value) => Validations.validateEmail(
                            email:
                                profileController.updateEmailController.text),
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
                          ),
                          labelText: "Email Address",
                          hintText: "Email Address",
                        ),
                      ),
                      SizedBox(height: AppSizes.formVerticalSpace * 1.7),

                      // Phone Number
                      TextFormField(
                        controller:
                            profileController.updatePhoneNumberController,
                        maxLength: 10,
                        validator: (value) => Validations.validatePhone(
                            phoneNumber: profileController
                                .updatePhoneNumberController.text),
                        keyboardType: TextInputType.number,
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
                            PhosphorIcons.phone_bold,
                            color: primaryColor,
                          ),
                          labelText: "Phone Number",
                          hintText: "Phone Number",
                        ),
                      ),
                      SizedBox(height: AppSizes.formVerticalSpace * 1.7),

                      PrimaryButton(
                        text: "Update Profile",
                        width: AppSizes.width - AppSizes.defaultVerticalPadding,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("Something wrong"),
              );
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

  Stack buildProfilePictureWidget(BuildContext context, UserModel userData) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          maxRadius: 80,
          foregroundImage: NetworkImage(userData.imageUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: IconButton(
              onPressed: () {
                buildShowModalBottomSheet(context);
              },
              icon: Icon(
                Icons.edit,
                color: primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: AppSizes.height * 0.15,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.extraVerticalPadding * 1.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Camera
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      profileController.updateUserProfilePictureFromCamera();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(color: primaryColor),
                      ),
                    ),
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: primaryColor,
                    ),
                  ),
                  Text("Camera"),
                ],
              ),

              // gallery
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      profileController.updateUserProfilePictureFromGallery();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(color: primaryColor),
                      ),
                    ),
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: primaryColor,
                    ),
                  ),
                  Text("Gallery"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
