import 'package:runstore_ecoomerce/libraries.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppStrings.welcomeBrief,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Icon(
            PhosphorIcons.envelope,
            color: Colors.green,
            size: 30.0,
            semanticLabel: 'New Note',
          ),
        ],
      ),
    );
  }
}
