import 'package:runstore_ecoomerce/libraries.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AppImages.bgImg,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomSheet(
                onClosing: () {},
                enableDrag: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(35),
                    right: Radius.circular(35),
                  ),
                ),
                builder: (context) {
                  return BottomSheetContainer(
                    height: AppSizes.height * 0.7,
                    isAppIconCenter: false,
                    appIconPositionFromLeft: AppSizes.width * 0.62,
                    childWidget: Column(
                      children: [
                        SizedBox(height: AppSizes.formVerticalSpace * 2.5),
                        // Login Form
                        LoginFormWidget(),
                        SizedBox(height: AppSizes.formVerticalSpace * 3),

                        // "or sign in with" text
                        Text(
                          "or sign in with",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(color: Colors.black, fontSizeFactor: 1.5),
                        ),
                        SizedBox(height: AppSizes.formVerticalSpace),

                        // Social Sign in Buttons
                        // 1 : Twitter
                        // 2 : Google
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // 1 : Twitter
                            PrimaryButton(
                              iconData: PhosphorIcons.twitter_logo_fill,
                              isPrimary: false,
                              text: "Twitter",
                              width: AppSizes.width * 0.37,
                              onTap: () {},
                            ),

                            // 2 : Google
                            PrimaryButton(
                              iconData: PhosphorIcons.google_logo_bold,
                              isPrimary: false,
                              text: "Google",
                              width: AppSizes.width * 0.37,
                              onTap: () {},
                            ),
                          ],
                        ),

                        SizedBox(height: AppSizes.formVerticalSpace * 2.2),

                        // "Sign Up" Text
                        TextButton(
                          onPressed: () {
                            Get.to(
                              () => RegisterScreen(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      color: primaryColor,
                                      fontWeightDelta: 2,
                                      fontSizeFactor: 1.5,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
