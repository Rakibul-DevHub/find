import 'package:find/page_frame.dart';
import 'package:find/features/products/product.dart';
import 'package:find/qty_button.dart';
import 'package:find/features/sale/model/sale_item.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../app_input.dart';
import '../../big_button.dart';
import '../../card_box.dart';
import '../../code_badge.dart';
import '../../label_text.dart';
import '../../mock_data.dart';

class QuickSellPage extends StatefulWidget {
  const QuickSellPage({super.key});

  @override
  State<QuickSellPage> createState() => _QuickSellPageState();
}

class _QuickSellPageState extends State<QuickSellPage> {
  final TextEditingController codeController = TextEditingController(
    text: 'TS001-L',
  );
  Product selectedProduct = products.first;
  int qty = 1;

  void searchProduct() {
    final code = codeController.text.trim().toUpperCase();
    final found = products.where((p) => p.code.toUpperCase() == code).toList();
    if (found.isNotEmpty) {
      setState(() {
        selectedProduct = found.first;
        qty = 1;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('এই কোডের পণ্য পাওয়া যায়নি')),
      );
    }
  }

  void completeSale() {
    if (selectedProduct.stock < qty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('স্টক পর্যাপ্ত নেই')));
      return;
    }
    setState(() {
      selectedProduct.stock -= qty;
      final today = DateTime.now();
      final dateKey =
          '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
      dailySales.putIfAbsent(dateKey, () => []);
      dailySales[dateKey]!.add(
        SaleItem(
          code: selectedProduct.code,
          name: selectedProduct.name,
          qty: qty,
          total: selectedProduct.sellPrice * qty,
          profit: (selectedProduct.sellPrice - selectedProduct.buyPrice) * qty,
        ),
      );
      qty = 1;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('বিক্রি সম্পন্ন হয়েছে')));
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'দ্রুত বিক্রি',
      subtitle: 'কোড দিন, বিক্রি শেষ করুন',
      child: buildQuickSellContent(context),
    );
  }

  Widget buildQuickSellContent(BuildContext context) {
    final total = selectedProduct.sellPrice * qty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBEB),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'বিক্রি করার সহজ নিয়ম',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                children: ['কোড দিন', 'পণ্য দেখুন', '+/- চাপুন', 'বিক্রি শেষ']
                    .asMap()
                    .entries
                    .map((entry) {
                      return Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '${entry.key + 1}',
                                style: const TextStyle(
                                  color: Color(0xFFD97706),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                entry.value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CardBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelText('পণ্য কোড'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: AppInput(
                      controller: codeController,
                      hint: 'যেমন: TS001-L',
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 56,
                    width: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: searchProduct,
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'কোড না জানলে নিচের সাম্প্রতিক পণ্য থেকে চাপ দিন।',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CardBox(
          borderColor: const Color(0xFFA7F3D0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CodeBadge(selectedProduct.code),
                        const SizedBox(height: 8),
                        Text(
                          selectedProduct.name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          'সাইজ: ${selectedProduct.variant} • স্টক: ${selectedProduct.stock}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'দাম',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        '৳ ${selectedProduct.sellPrice}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QtyButton(
                      icon: Icons.remove,
                      onTap: () => setState(() => qty = qty > 1 ? qty - 1 : 1),
                    ),
                    Column(
                      children: [
                        const Text(
                          'পরিমাণ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '$qty',
                          style: const TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    QtyButton(
                      icon: Icons.add,
                      onTap: () => setState(() => qty++),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'মোট',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '৳ $total',
                    style: const TextStyle(
                      color: green,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BigButton(
                text: 'বিক্রি সম্পন্ন',
                icon: Icons.check_circle,
                onTap: completeSale,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'সাম্প্রতিক পণ্য',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 78,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) {
              final p = products[index];
              return InkWell(
                onTap: () => setState(() {
                  selectedProduct = p;
                  codeController.text = p.code;
                  qty = 1;
                }),
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 118,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text(
                        p.code,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
