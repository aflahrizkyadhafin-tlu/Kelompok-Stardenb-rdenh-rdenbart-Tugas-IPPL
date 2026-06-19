import 'package:flutter/material.dart';
import 'package:frontendmykurir_rizqi/pages/pilihrole/pilihrole_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PilihroleScreen()),
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: Center(
        child: Image.asset(
          'assets/icons/loading.png',
          width: 75,
          height: 75,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
