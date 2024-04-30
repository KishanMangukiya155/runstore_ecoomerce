import 'package:runstore_ecoomerce/libraries.dart';

import '../forgot password view/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final signInController = Get.find<SignInController>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.extraHorizontalPadding * 1.5,
            right: AppSizes.extraHorizontalPadding * 1.5,
            top: AppSizes.extraVerticalPadding * 1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 80,
                backgroundImage: AssetImage('assets/images/shopping-logo.png'),
              ),
              SizedBox(height: AppSizes.formVerticalSpace * 2),
              // Login Form
              LoginFormWidget(),

              // Forgot Password
              TextButton(
                onPressed: () {
                  Get.to(
                    () => ForgotPasswordScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Text("Forgot Password"),
              ),
              SizedBox(height: AppSizes.formVerticalSpace * 1.5),

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
                    onTap: () {
                      signInController.signInWithGoogle();
                    },
                  ),
                ],
              ),

              SizedBox(height: AppSizes.formVerticalSpace * 2.2),

              // "Sign Up" Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Need Account?",
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          fontSizeFactor: 1.5,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => RegisterScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: primaryColor,
                            fontWeightDelta: 2,
                            fontSizeFactor: 1.5,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
