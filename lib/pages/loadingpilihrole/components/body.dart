import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:frontendmykurir_rizqi/pages/pilihrole/pilihrole_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Animasi rotasi konstan
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 1 detik per satu putaran penuh
    )..repeat();

    //   _navigateToNextPage();
  }

  void _navigateToNextPage() {
    // Delay 3 detik sebelum masuk ke halaman pilih role
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PilihroleScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          // Gambar ditaruh di sini agar tidak ikut ter-rebuild berulang kali
          child: Image.asset(
            'assets/icons/loading.png',
            width: 75,
            height: 75,
            fit: BoxFit.contain,
          ),
          builder: (context, child) {
            return Transform.rotate(
              // Menggunakan math.pi dan memanfaatkan widget child yang sudah di-cache
              angle: -_animationController.value * 2 * math.pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
