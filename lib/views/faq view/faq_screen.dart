import 'package:runstore_ecoomerce/libraries.dart';

class Faq_Screen extends StatelessWidget {
  const Faq_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "FAQ",
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: SizedBox(),
    );
  }
}
