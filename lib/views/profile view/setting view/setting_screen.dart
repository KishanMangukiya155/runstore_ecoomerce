import '../../../libraries.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Setting",
          leadingCardButton: true,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
    );
  }
}
