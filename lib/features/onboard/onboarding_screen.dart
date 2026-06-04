import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../big_button.dart';
import '../language_selection/language_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {'title': 'Shop Manager', 'subtitle': 'Small Store Management System - Bangladesh', 'showShop': true},
    {'title': 'দোকান চালানো এখন', 'subtitle': 'খাতার চেয়েও সহজ', 'showShop': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) => setState(() => _currentPage = page),
            itemCount: _pages.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [BoxShadow(color: Color(0x1F000000), blurRadius: 20, offset: Offset(0, 10))],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('assets/images/logo.png', width: 140, height: 140, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (_pages[index]['showShop'] as bool)
                    Column(
                      children: [
                        Text('SHOP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: 4, color: Colors.grey.shade500)),
                        const SizedBox(height: 10),
                      ],
                    ),
                  Text(_pages[index]['title'] as String, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.black87), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  Text(_pages[index]['subtitle'] as String, style: TextStyle(fontSize: 18, color: Colors.grey.shade600, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LanguageScreen())),
              child: Text(_currentPage == _pages.length - 1 ? '跳过' : 'Skip', style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(color: _currentPage == index ? green : Colors.grey.shade300, borderRadius: BorderRadius.circular(4)),
              )),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: BigButton(
              text: _currentPage == _pages.length - 1 ? 'শুরু করুন' : 'পরবর্তী',
              icon: _currentPage == _pages.length - 1 ? Icons.check_circle : Icons.arrow_forward,
              onTap: () {
                if (_currentPage == _pages.length - 1) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LanguageScreen()));
                } else {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}