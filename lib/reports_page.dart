import 'package:find/page_frame.dart';
import 'package:find/features/home/summary_card.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'card_box.dart';
import 'code_badge.dart';
import 'mock_data.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String selectedDate = dailySales.keys.first;

  @override
  Widget build(BuildContext context) {
    final sales = dailySales[selectedDate] ?? [];
    final totalSales = sales.fold<int>(0, (sum, item) => sum + item.total);
    final totalProfit = sales.fold<int>(0, (sum, item) => sum + item.profit);
    final totalQty = sales.fold<int>(0, (sum, item) => sum + item.qty);
    final dates = dailySales.keys.toList()..sort();

    return PageFrame(
      title: 'ডেইলি রিপোর্ট',
      subtitle: 'তারিখ সিলেক্ট করে বিক্রি দেখুন',
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('তারিখ নির্বাচন করুন', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: dates.map((date) {
                    final selected = selectedDate == date;
                    return ChoiceChip(
                      selected: selected,
                      label: Text('${date.substring(8, 10)} তারিখ'),
                      onSelected: (_) => setState(() => selectedDate = date),
                      selectedColor: green,
                      labelStyle: TextStyle(color: selected ? Colors.white : Colors.black, fontWeight: FontWeight.w900),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: SummaryCard(label: 'মোট বিক্রি', value: '৳ $totalSales')),
              const SizedBox(width: 10),
              Expanded(child: SummaryCard(label: 'লাভ', value: '৳ $totalProfit', valueColor: green)),
              const SizedBox(width: 10),
              Expanded(child: SummaryCard(label: 'পিস', value: '$totalQty')),
            ],
          ),
          const SizedBox(height: 18),
          Text('$selectedDate তারিখে যা বিক্রি হয়েছে', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          ...sales.map((item) => CardBox(
            marginBottom: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CodeBadge(item.code),
                  const SizedBox(height: 8),
                  Text(item.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  Text('পরিমাণ: ${item.qty} পিস', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700)),
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('৳ ${item.total}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                  Text('লাভ ৳ ${item.profit}', style: const TextStyle(color: green, fontWeight: FontWeight.w900)),
                ]),
              ],
            ),
          )),
        ],
      ),
    );
  }
}