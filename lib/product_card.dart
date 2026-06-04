import 'package:find/features/products/product.dart';
import 'package:flutter/material.dart';
import 'utils/app_colors.dart';
import 'code_badge.dart';
import 'card_box.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isLow = product.stock <= 3;
    return CardBox(
      marginBottom: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CodeBadge(product.code),
              const SizedBox(height: 8),
              Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
              Text('${product.variant} • কেনা ৳ ${product.buyPrice} • বিক্রি ৳ ${product.sellPrice}', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700)),
            ]),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: isLow ? const Color(0xFFFEF2F2) : bg, borderRadius: BorderRadius.circular(18)),
            child: Column(children: [
              Text('স্টক', style: TextStyle(color: isLow ? red : Colors.grey, fontWeight: FontWeight.w800, fontSize: 12)),
              Text('${product.stock}', style: TextStyle(color: isLow ? red : Colors.black, fontSize: 24, fontWeight: FontWeight.w900)),
            ]),
          ),
        ],
      ),
    );
  }
}