import 'package:runstore_ecoomerce/controller/signUp_controller.dart';
import 'package:runstore_ecoomerce/utility/validations.dart';

import '../../../../libraries.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    final signUpController = Get.find<SignUpController>();
    return Form(
      key: signUpController.registerFormKey,
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
            controller: signUpController.fullNameController,
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
            controller: signUpController.emailController,
            validator: (value) => Validations.validateEmail(
                email: signUpController.emailController.text),
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
            controller: signUpController.phoneNumberController,
            maxLength: 10,
            validator: (value) => Validations.validatePhone(
                phoneNumber: signUpController.phoneNumberController.text),
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

          // Password field
          Obx(() {
            return TextFormField(
              controller: signUpController.passwordController,
              validator: (value) => Validations.validatePassword(
                password: signUpController.passwordController.text,
              ),
              obscureText: signUpController.obscureText.value,
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
                  PhosphorIcons.lock_bold,
                  color: primaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    signUpController
                        .obscureText(!signUpController.obscureText.value);
                  },
                  icon: Icon(
                    signUpController.obscureText.isTrue
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
              signUpController.userSignUp();
            },
          ),
        ],
      ),
    );
  }
}
