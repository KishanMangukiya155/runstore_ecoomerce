import 'package:runstore_ecoomerce/libraries.dart';

BoxShadow applyBoxShadow() {
  return BoxShadow(
    offset: Offset(0, 1),
    color: primaryColor.withOpacity(0.015),
    blurRadius: 20,
    spreadRadius: 1,
  );
}
