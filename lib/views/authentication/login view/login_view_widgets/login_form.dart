import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../libraries.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign In",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .apply(fontSizeDelta: 2.2),
          ),
          SizedBox(height: AppSizes.formVerticalSpace),

          // Email field
          TextFormField(
            controller: authController.emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.envelope,
                  color: primaryColor,
                  size: AppSizes.formIconHeight,
                ),
              ),
              labelText: "Email Address",
              hintText: "Email Address",
            ),
          ),
          SizedBox(height: AppSizes.formVerticalSpace),

          // Password field
          TextFormField(
            controller: authController.passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.lock,
                  color: primaryColor,
                  size: AppSizes.formIconHeight,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  PhosphorIcons.eye_closed_bold,
                  color: primaryColor.withOpacity(0.5),
                ),
              ),
              labelText: "Password",
              hintText: "Password",
            ),
          ),
          SizedBox(height: 20),

          PrimaryButton(
            text: "Sign In",
            width: AppSizes.width - AppSizes.defaultVerticalPadding,
            onTap: () {
              Get.offAll(() => RootScreen());
            },
          ),
        ],
      ),
    );
  }
}
