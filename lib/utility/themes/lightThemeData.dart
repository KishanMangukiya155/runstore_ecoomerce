import '../../libraries.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    onBackground: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: lightTextTheme,
  fontFamily: "Amiko",
  useMaterial3: true,
);

// ==== TextTheme ==== //
TextTheme lightTextTheme = TextTheme(
  displayMedium: TextStyle(
    fontSize: AppSizes.height * 0.045,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  ),
  titleMedium: TextStyle(
    fontSize: AppSizes.height * 0.019,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  ),
  titleSmall: TextStyle(
    fontSize: AppSizes.height * 0.015,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  ),
);
