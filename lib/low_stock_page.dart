import 'package:find/page_frame.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'card_box.dart';
import 'code_badge.dart';
import 'mock_data.dart';

class LowStockPage extends StatelessWidget {
  const LowStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lowStock = products.where((p) => p.stock <= 8).toList();
    return PageFrame(
      title: 'কম স্টক',
      subtitle: 'যেগুলো দ্রুত কিনতে হবে',
      showBack: true,
      child: Column(
        children: lowStock.map((p) => CardBox(
          marginBottom: 12,
          borderColor: const Color(0xFFFECACA),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CodeBadge(p.code, color: red, bgColor: const Color(0xFFFEF2F2)),
                const SizedBox(height: 8),
                Text(p.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                Text(p.variant, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700)),
              ]),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(color: const Color(0xFFFEF2F2), borderRadius: BorderRadius.circular(18)),
                child: Column(children: [
                  const Text('বাকি স্টক', style: TextStyle(color: red, fontWeight: FontWeight.w800, fontSize: 12)),
                  Text('${p.stock}', style: const TextStyle(color: red, fontSize: 30, fontWeight: FontWeight.w900)),
                ]),
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }
}