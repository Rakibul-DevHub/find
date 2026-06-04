import 'package:find/products_page.dart';
import 'package:find/features/sale/quick_sell_page.dart';
import 'package:flutter/material.dart';

import '../due/due_page.dart';
import '../home/home_page.dart';
import '../more/more_page.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const QuickSellPage(),
    const ProductsPage(),
    const DuePage(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 72,
        selectedIndex: selectedIndex,
        indicatorColor: const Color(0xFFD1FAE5),
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'হোম'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), label: 'বিক্রি'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), label: 'পণ্য'),
          NavigationDestination(icon: Icon(Icons.money), label: 'বাকি'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'আরও'),
        ],
      ),
    );
  }
}