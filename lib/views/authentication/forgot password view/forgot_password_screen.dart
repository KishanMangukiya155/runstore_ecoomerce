import 'package:runstore_ecoomerce/libraries.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInController = Get.find<SignInController>();
    return Scaffold(
      body: Form(
        key: signInController.forgotPasswordFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.extraHorizontalPadding * 1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.formVerticalSpace * 4),
              Text(
                "Reset Password",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(fontSizeDelta: 2.2),
              ),
              SizedBox(height: AppSizes.formVerticalSpace * 1.5),
              Text(
                "Write email to reset the password",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .apply(fontSizeDelta: -15),
              ),
              SizedBox(height: AppSizes.formVerticalSpace * 2.5),

              // Email field
              TextFormField(
                controller: signInController.emailController,
                validator: (value) => Validations.validateEmail(
                    email: signInController.emailController.text),
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
              SizedBox(height: AppSizes.formVerticalSpace * 1.7),

              PrimaryButton(
                text: "Send link",
                width: AppSizes.width - AppSizes.defaultVerticalPadding,
                onTap: () {
                  signInController
                      .resetPassword(signInController.emailController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
