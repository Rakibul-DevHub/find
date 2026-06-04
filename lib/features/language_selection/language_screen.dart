import 'package:find/simple_page.dart';
import 'package:flutter/material.dart';
import '../../big_button.dart';
import '../../login_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      title: 'ভাষা নির্বাচন করুন',
      subtitle: 'Choose your app language',
      child: Column(
        children: [
          BigButton(text: 'বাংলা', icon: Icons.language, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()))),
          const SizedBox(height: 16),
          BigButton(text: 'English', icon: Icons.translate, filled: false, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()))),
        ],
      ),
    );
  }
}