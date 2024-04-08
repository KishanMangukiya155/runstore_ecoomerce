import 'package:runstore_ecoomerce/libraries.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.defaultVerticalPadding,
            horizontal: AppSizes.extraHorizontalPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardButton(
                    iconData: Icons.arrow_back,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend Code?",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            fontSizeDelta: 1.5,
                            fontWeightDelta: 2,
                            color: Colors.black,
                          ),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.extraDefaultHeight * 3),
              Text(
                AppStrings.verifyCode,
                style: Theme.of(context).textTheme.displayMedium!.apply(
                      fontSizeFactor: 0.9,
                      fontWeightDelta: 2,
                    ),
              ),
              SizedBox(height: AppSizes.defaultHeight),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultHorizontalPadding * 1.2),
                child: Text(
                  AppStrings.verifyCodeBrief,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: AppSizes.defaultHeight * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  5,
                  (index) => Container(
                    height: 55,
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: primaryColor, width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.defaultHeight * 2),
              PrimaryButton(
                text: "Done",
                width: MediaQuery.sizeOf(context).width -
                    AppSizes.defaultVerticalPadding,
                onTap: () {
                  Get.offAll(() => RootScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
