import 'package:course/palette.dart';
import 'package:course/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Palette.backgroundColor,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: Palette.backgroundColor,
      ),
      home: const HomeScreen(),
    );
  }
}
