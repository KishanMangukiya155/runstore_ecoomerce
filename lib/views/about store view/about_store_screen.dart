import 'package:runstore_ecoomerce/libraries.dart';

class AboutStoreScreen extends StatelessWidget {
  const AboutStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "About store",
          actionCardButton: CardButton(
            iconData: Icons.search,
            onTap: () {},
          ),
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
      body: SizedBox(),
    );
  }
}
