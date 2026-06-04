import 'package:find/page_frame.dart';
import 'package:find/product_card.dart';
import 'package:flutter/material.dart';
import 'add_product_page.dart';
import 'utils/app_colors.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'mock_data.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = products.where((p) => p.code.toLowerCase().contains(query.toLowerCase()) || p.name.contains(query)).toList();

    return PageFrame(
      title: 'পণ্য / স্টক',
      subtitle: 'কোড দিয়ে দ্রুত খুঁজুন',
      child: Column(
        children: [
          BigButton(text: 'নতুন পণ্য যোগ করুন', icon: Icons.add, onTap: () async {
            await Navigator.push(context, MaterialPageRoute(builder: (_) => const AddProductPage()));
            setState(() {});
          }),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0xFFA7F3D0))),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.tag, color: green),
                SizedBox(width: 10),
                Expanded(child: Text('যেমন: TS001-L দিলে সরাসরি টি-শার্ট L পাওয়া যাবে। নাম লিখতে হবে না।', style: TextStyle(color: green, fontWeight: FontWeight.w800))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppInput(hint: 'কোড বা নাম লিখুন', prefixIcon: Icons.search, onChanged: (v) => setState(() => query = v)),
          const SizedBox(height: 14),
          ...filtered.map((p) => ProductCard(product: p)),
        ],
      ),
    );
  }
}