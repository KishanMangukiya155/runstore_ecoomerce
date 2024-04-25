import 'package:runstore_ecoomerce/libraries.dart';

class SupoortScreen extends StatelessWidget {
  const SupoortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.onInit(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Support",
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: SizedBox(),
    );
  }
}
