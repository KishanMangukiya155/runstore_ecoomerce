import 'package:runstore_ecoomerce/controller/signIn_controller.dart';

import '../../../../libraries.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final signInController = Get.find<SignInController>();
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
          SizedBox(height: AppSizes.formVerticalSpace * 1.5),

          // Email field
          TextFormField(
            controller: signInController.emailController,
            decoration: InputDecoration(
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
          SizedBox(height: AppSizes.formVerticalSpace * 1.7),

          // Password field
          Obx(() {
            return TextFormField(
              controller: signInController.passwordController,
              obscureText: signInController.obscureText.value,
              decoration: InputDecoration(
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
                    signInController
                        .obscureText(!signInController.obscureText.value);
                  },
                  icon: Icon(
                    signInController.obscureText.isTrue
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
          // Row(
          //   children: [
          //     Obx(() {
          //       return Checkbox(
          //         value: signInController.isRememberMe.value,
          //         checkColor: Colors.white,
          //         activeColor: primaryColor,
          //         onChanged: (value) {
          //           signInController
          //               .isRememberMe(!signInController.isRememberMe.value);
          //         },
          //       );
          //     }),
          //     Text(
          //       "Remember Me",
          //       style: Theme.of(context).textTheme.titleMedium!.apply(
          //             color: signInController.isRememberMe.isTrue
          //                 ? Colors.black54
          //                 : Colors.black38,
          //           ),
          //     ),
          //   ],
          // ),
          SizedBox(height: AppSizes.formVerticalSpace),

          PrimaryButton(
            text: "Sign In",
            width: AppSizes.width - AppSizes.defaultVerticalPadding,
            onTap: () {
              signInController.signInUser(
                email: signInController.emailController.text.trim(),
                password: signInController.passwordController.text.trim(),
              );
            },
          ),
        ],
      ),
    );
  }
}
