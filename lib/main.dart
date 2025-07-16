import 'package:fahiz_portfolio/res/constants.dart';
import 'package:fahiz_portfolio/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fahiz Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        primaryColor: primaryColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor,
          onSecondary: Colors.white,
          background: bgColor,
          onBackground: bodyTextColor,
          surface: darkColor,
          onSurface: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: bodyTextColor,
          displayColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
