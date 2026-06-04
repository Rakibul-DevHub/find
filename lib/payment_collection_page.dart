import 'package:find/page_frame.dart';
import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'app_input.dart';
import 'big_button.dart';
import 'card_box.dart';
import 'features/due/customer_due.dart';
import 'label_text.dart';

class PaymentCollectionPage extends StatefulWidget {
  final CustomerDue customer;
  const PaymentCollectionPage({super.key, required this.customer});

  @override
  State<PaymentCollectionPage> createState() => _PaymentCollectionPageState();
}

class _PaymentCollectionPageState extends State<PaymentCollectionPage> {
  final amountController = TextEditingController();

  void savePayment() {
    final amount = int.tryParse(amountController.text.trim()) ?? 0;
    if (amount <= 0) return;
    setState(() => widget.customer.due = (widget.customer.due - amount).clamp(0, 999999999));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('পেমেন্ট সেভ হয়েছে')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'টাকা আদায়',
      subtitle: widget.customer.name,
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('মোট বাকি', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800)),
            Text('৳ ${widget.customer.due}', style: const TextStyle(color: red, fontSize: 34, fontWeight: FontWeight.w900)),
          ])),
          const SizedBox(height: 18),
          const LabelText('কত টাকা পেয়েছেন?'),
          const SizedBox(height: 8),
          AppInput(controller: amountController, hint: '৳ 0', keyboardType: TextInputType.number),
          const SizedBox(height: 18),
          BigButton(text: 'পেমেন্ট সেভ করুন', icon: Icons.save, onTap: savePayment),
        ],
      ),
    );
  }
}