import 'package:flutter/gestures.dart';

import '../../../libraries.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.extraHorizontalPadding * 1.5,
            right: AppSizes.extraHorizontalPadding * 1.5,
            bottom: AppSizes.minorVerticalPadding,
            top: AppSizes.extraVerticalPadding * 1,
          ),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 60,
                backgroundImage: AssetImage('assets/images/shopping-logo.png'),
              ),
              SizedBox(
                height: AppSizes.formVerticalSpace * 1,
              ),

              // Register Form
              RegisterFormWidget(),
              SizedBox(height: AppSizes.formVerticalSpace * 2),
              Text(AppStrings.termsNCondition),

              // Terms and condition text with
              // tap events/functions
              RichText(
                text: TextSpan(
                  text: "Terms",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: primaryColor, fontSizeDelta: 1.2),
                  recognizer: TapGestureRecognizer()..onTap = () => {},
                  children: [
                    TextSpan(
                      text: " and ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "Condition of Use",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: primaryColor, fontSizeDelta: 1.2),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                  ],
                ),
              ),

              // "Login" TextButton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have Account?",
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          fontSizeFactor: 1.5,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Sign In",
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
