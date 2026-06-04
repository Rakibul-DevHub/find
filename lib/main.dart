import 'package:find/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShopManagerApp());
}

class ShopManagerApp extends StatelessWidget {
  const ShopManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'NotoSansBengali',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF059669)),
      ),
      home: const SplashScreen(),
    );
  }
}