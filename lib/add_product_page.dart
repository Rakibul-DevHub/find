import 'package:find/page_frame.dart';
import 'package:find/features/products/product.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'label_text.dart';
import 'mock_data.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameController = TextEditingController();
  final variantController = TextEditingController();
  final codeController = TextEditingController(text: 'TS002-L');
  final buyController = TextEditingController();
  final sellController = TextEditingController();
  final stockController = TextEditingController();

  void saveProduct() {
    if (nameController.text.trim().isEmpty || codeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('পণ্যের নাম ও কোড দিন')));
      return;
    }

    products.add(Product(
      code: codeController.text.trim(),
      name: nameController.text.trim(),
      variant: variantController.text.trim().isEmpty ? '-' : variantController.text.trim(),
      buyPrice: int.tryParse(buyController.text.trim()) ?? 0,
      sellPrice: int.tryParse(sellController.text.trim()) ?? 0,
      stock: int.tryParse(stockController.text.trim()) ?? 0,
    ));

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('পণ্য সেভ হয়েছে')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'নতুন পণ্য যোগ',
      subtitle: 'একবার যোগ করলে পরে কোড দিয়েই বিক্রি',
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelText('পণ্যের নাম'),
          const SizedBox(height: 8),
          AppInput(controller: nameController, hint: 'যেমন: টি-শার্ট'),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const LabelText('সাইজ/ধরন'), const SizedBox(height: 8), AppInput(controller: variantController, hint: 'L / 5kg')])),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const LabelText('কোড'), const SizedBox(height: 8), AppInput(controller: codeController, hint: 'TS002-L')])),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const LabelText('কেনা দাম'), const SizedBox(height: 8), AppInput(controller: buyController, hint: '৳ 0', keyboardType: TextInputType.number)])),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const LabelText('বিক্রি দাম'), const SizedBox(height: 8), AppInput(controller: sellController, hint: '৳ 0', keyboardType: TextInputType.number)])),
            ],
          ),
          const SizedBox(height: 14),
          const LabelText('স্টক সংখ্যা'),
          const SizedBox(height: 8),
          AppInput(controller: stockController, hint: 'যেমন: 20', keyboardType: TextInputType.number),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(18)),
            child: const Text('কিভাবে যোগ করবেন?\n১. নাম লিখুন → ২. সাইজ দিন → ৩. দাম ও স্টক দিন → ৪. সেভ করুন। এরপর বিক্রির সময় শুধু কোড লিখলেই পণ্য আসবে।', style: TextStyle(fontWeight: FontWeight.w800, height: 1.5)),
          ),
          const SizedBox(height: 18),
          BigButton(text: 'পণ্য সেভ করুন', icon: Icons.save, onTap: saveProduct),
        ],
      ),
    );
  }
}