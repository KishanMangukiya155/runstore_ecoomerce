import 'package:flutter/gestures.dart';

import '../../../libraries.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  appIconPositionFromLeft: 250,
                  childWidget: Form(
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.formVerticalSpace * 2.5),
                        // Login Form
                        RegisterFormWidget(),
                        SizedBox(height: AppSizes.formVerticalSpace),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {},
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
                                    .apply(
                                        color: primaryColor,
                                        fontSizeDelta: 1.2),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
