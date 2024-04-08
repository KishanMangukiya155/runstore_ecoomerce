import 'package:runstore_ecoomerce/libraries.dart';

BoxShadow applyBoxShadow() {
  return BoxShadow(
    offset: Offset(0, 3),
    color: primaryColor.withOpacity(0.2),
    blurRadius: 2,
    spreadRadius: 1,
  );
}
