import '../../libraries.dart';

ThemeData darkThemeData = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    onBackground: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: darkTextTheme,
  fontFamily: "Amiko",
  useMaterial3: true,
);

// ==== TextTheme ==== //
TextTheme darkTextTheme = TextTheme(
  displayMedium: TextStyle(
    fontSize: AppSizes.height * 0.045,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  ),
  titleMedium: TextStyle(
    fontSize: AppSizes.height * 0.019,
    color: Colors.white70,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontSize: AppSizes.height * 0.015,
    color: Colors.white70,
    fontWeight: FontWeight.w600,
  ),
);
