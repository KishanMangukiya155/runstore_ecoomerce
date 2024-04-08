import 'package:runstore_ecoomerce/libraries.dart';

class SwitchListTileWidget extends StatelessWidget {
  const SwitchListTileWidget({
    super.key,
    required this.titleText,
    required this.switchValue,
    required this.onChanged,
  });

  final String titleText;
  final bool switchValue;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.titleSmall!.apply(
            color: switchValue ? Colors.black54 : Colors.black26,
            fontSizeFactor: 1.2),
      ),
      trailing: Switch(
        value: switchValue,
        activeColor: primaryColor,
        onChanged: onChanged,
        inactiveThumbColor: Colors.black12,
        inactiveTrackColor: Colors.black26,
      ),
    );
  }
}
