import 'package:find/page_frame.dart';
import 'package:find/products_page.dart';
import 'package:find/reports_page.dart';
import 'package:find/features/home/summary_card.dart';
import 'package:flutter/material.dart';
import '../../action_tile.dart';
import '../../utils/app_colors.dart';
import '../due/due_page.dart';
import '../../expense_page.dart';
import '../sale/quick_sell_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'রহিম স্টোর',
      subtitle: 'আজকের হিসাব',
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: SummaryCard(label: 'আজ বিক্রি', value: '৳ ৮,৪৫০')),
              SizedBox(width: 10),
              Expanded(child: SummaryCard(label: 'লাভ', value: '৳ ১,২৫০', valueColor: green)),
              SizedBox(width: 10),
              Expanded(child: SummaryCard(label: 'বাকি', value: '৳ ২,৩৫০', valueColor: red)),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: null, // Will be set in builder
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFFEF2F2), borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFFECACA))),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: red),
                  SizedBox(width: 10),
                  Text('৩টি পণ্যের স্টক কম', style: TextStyle(color: red, fontWeight: FontWeight.w900, fontSize: 16)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.2,
            children: [
              ActionTile(title: 'দ্রুত বিক্রি', icon: Icons.shopping_cart_outlined, filled: true, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuickSellPage()))),
              ActionTile(title: 'স্টক / পণ্য', icon: Icons.inventory_2_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductsPage()))),
              ActionTile(title: 'বাকি খাতা', icon: Icons.note_alt_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DuePage()))),
              ActionTile(title: 'খরচ', icon: Icons.account_balance_wallet_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpensePage()))),
              ActionTile(title: 'রিপোর্ট', icon: Icons.assessment_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportsPage()))),
              ActionTile(title: 'সহকারী', icon: Icons.people_alt_outlined, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}