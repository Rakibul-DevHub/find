import 'utils/app_colors.dart';
import 'package:find/simple_page.dart';
import 'package:flutter/material.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'label_text.dart';
import 'features/bottom_navigation/main_bottom_nav.dart';

class ShopSetupScreen extends StatelessWidget {
  const ShopSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopTypes = ['মুদি দোকান', 'কাপড়', 'মোবাইল এক্সেসরিজ', 'কসমেটিকস'];
    return SimplePage(
      title: 'দোকান সেটআপ',
      subtitle: 'মাত্র ১ মিনিটে শুরু করুন',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('দোকানের নাম'),
          const SizedBox(height: 8),
          const AppInput(hint: 'যেমন: রহিম স্টোর'),
          const SizedBox(height: 22),
          const LabelText('দোকানের ধরন'),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 2.1),
            itemCount: shopTypes.length,
            itemBuilder: (_, i) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i == 0 ? const Color(0xFFECFDF5) : Colors.white,
                border: Border.all(color: i == 0 ? green : const Color(0xFFE2E8F0), width: 2),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(shopTypes[i], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            ),
          ),
          const SizedBox(height: 24),
          BigButton(text: 'এখনই শুরু করুন', icon: Icons.arrow_forward, onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()), (_) => false)),
        ],
      ),
    );
  }
}