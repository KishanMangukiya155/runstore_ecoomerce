import '../../../../libraries.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .apply(fontSizeDelta: 2),
          ),
          SizedBox(height: AppSizes.formVerticalSpace),

          // Full name field
          TextFormField(
            controller: authController.fullNameController,
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
            controller: authController.emailController,
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
              ),
              labelText: "Email Address",
              hintText: "Email Address",
            ),
          ),
          SizedBox(height: AppSizes.formVerticalSpace * 1.7),

          // Phone Number
          TextFormField(
            controller: authController.phoneNumber,
            keyboardType: TextInputType.number,
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
                PhosphorIcons.phone_bold,
                color: primaryColor,
              ),
              labelText: "Phone Number",
              hintText: "Phone Number",
            ),
          ),
          SizedBox(height: AppSizes.formVerticalSpace * 1.7),

          // Password field
          Obx(() {
            return TextFormField(
              controller: authController.passwordController,
              obscureText: authController.obscureText.value,
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
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    authController.changeObscureText();
                  },
                  icon: Icon(
                    authController.obscureText.isTrue
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
          SizedBox(height: AppSizes.extraVerticalPadding * 2),

          // "Create an account" button
          PrimaryButton(
            text: "Create an account",
            width: MediaQuery.sizeOf(context).width -
                AppSizes.defaultVerticalPadding,
            onTap: () {
              Get.to(() => VerificationScreen());
            },
          ),
        ],
      ),
    );
  }
}