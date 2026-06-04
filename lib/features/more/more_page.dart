import 'package:find/page_frame.dart';
import 'package:flutter/material.dart';
import '../../reports_page.dart';
import '../../expense_page.dart';
import '../../low_stock_page.dart';
import 'more_tile.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'আরও',
      subtitle: 'অন্য অপশনগুলো',
      child: Column(
        children: [
          MoreTile(title: 'রিপোর্ট', icon: Icons.assessment_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportsPage()))),
          MoreTile(title: 'খরচ', icon: Icons.account_balance_wallet_outlined, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpensePage()))),
          MoreTile(title: 'কম স্টক', icon: Icons.warning_amber, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LowStockPage()))),
          MoreTile(title: 'সেটিংস', icon: Icons.settings_outlined, onTap: () {}),
        ],
      ),
    );
  }
}