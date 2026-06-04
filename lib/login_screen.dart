import 'package:find/simple_page.dart';
import 'package:flutter/material.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'label_text.dart';
import 'shop_setup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      title: 'মোবাইল নম্বর দিন',
      subtitle: 'পাসওয়ার্ড লাগবে না। OTP দিয়ে ঢুকুন।',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('ফোন নম্বর'),
          const SizedBox(height: 8),
          const AppInput(hint: '01XXXXXXXXX', keyboardType: TextInputType.phone),
          const SizedBox(height: 18),
          BigButton(text: 'OTP পাঠান', icon: Icons.sms, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ShopSetupScreen()))),
        ],
      ),
    );
  }
}