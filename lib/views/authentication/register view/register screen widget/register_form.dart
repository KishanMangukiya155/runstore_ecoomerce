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
          SizedBox(height: 15),

          // Full name field
          TextFormField(
            controller: authController.fullNameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                PhosphorIcons.user_bold,
                color: primaryColor,
              ),
              labelText: "Full name",
              hintText: "Full name",
            ),
          ),
          SizedBox(height: 15),

          // Email field
          TextFormField(
            controller: authController.emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                PhosphorIcons.envelope_bold,
                color: primaryColor,
              ),
              labelText: "Email Address",
              hintText: "Email Address",
            ),
          ),
          SizedBox(height: 15),

          // Phone Number
          TextFormField(
            controller: authController.phoneNumber,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                PhosphorIcons.phone_bold,
                color: primaryColor,
              ),
              labelText: "Phone Number",
              hintText: "Phone Number",
            ),
          ),
          SizedBox(height: 15),

          // Password field
          TextFormField(
            controller: authController.passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                PhosphorIcons.lock_bold,
                color: primaryColor,
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
