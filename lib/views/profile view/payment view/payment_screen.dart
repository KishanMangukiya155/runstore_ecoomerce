import '../../../libraries.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppbarWidget(
          title: "Payment",
          leadingCardButton: true,
        ),
        preferredSize: Size.fromHeight(AppSizes.appBarPreferredSize),
      ),
    );
  }
}
