import 'package:find/page_frame.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../big_button.dart';
import '../../card_box.dart';
import '../../mock_data.dart';
import '../../payment_collection_page.dart';

class DuePage extends StatefulWidget {
  const DuePage({super.key});

  @override
  State<DuePage> createState() => _DuePageState();
}

class _DuePageState extends State<DuePage> {
  @override
  Widget build(BuildContext context) {
    return PageFrame(
      title: 'বাকি খাতা',
      subtitle: 'কার কাছে কত টাকা আছে',
      child: Column(
        children: dueCustomers.map((c) {
          return CardBox(
            marginBottom: 14,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(c.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                      Text(c.phone, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700)),
                    ]),
                    Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      const Text('বাকি', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800)),
                      Text('৳ ${c.due}', style: const TextStyle(color: red, fontSize: 28, fontWeight: FontWeight.w900)),
                    ]),
                  ],
                ),
                const SizedBox(height: 14),
                BigButton(text: 'টাকা আদায়', icon: Icons.payments, onTap: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentCollectionPage(customer: c)));
                  setState(() {});
                }),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}