import 'package:find/page_frame.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'label_text.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    final expenses = ['দোকান ভাড়া', 'বেতন', 'বিদ্যুৎ', 'পরিবহন', 'অন্যান্য'];
    return PageFrame(
      title: 'খরচ যোগ করুন',
      subtitle: 'আজকের খরচ লিখুন',
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('খরচের ধরন'),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expenses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.3,
            ),
            itemBuilder: (_, i) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: i == 0 ? const Color(0xFFECFDF5) : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: i == 0 ? green : const Color(0xFFE2E8F0),
                  width: 2,
                ),
              ),
              child: Text(
                expenses[i],
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          const SizedBox(height: 18),
          const LabelText('টাকার পরিমাণ'),
          const SizedBox(height: 8),
          const AppInput(hint: '৳ 0', keyboardType: TextInputType.number),
          const SizedBox(height: 14),
          const LabelText('নোট'),
          const SizedBox(height: 8),
          const AppInput(hint: 'চাইলে লিখুন'),
          const SizedBox(height: 18),
          BigButton(
            text: 'খরচ সেভ করুন',
            icon: Icons.save,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
