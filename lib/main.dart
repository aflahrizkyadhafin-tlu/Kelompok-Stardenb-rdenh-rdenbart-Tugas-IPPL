import 'package:flutter/material.dart';
import 'package:frontendmykurir_rizqi/pages/ratingaplikasi/ratingaplikasi_screen.dart';

// Pastikan import di bawah ini disesuaikan dengan lokasi folder aslinya ya
import 'package:frontendmykurir_rizqi/pages/terimakasihpenilaian/terimakasihpenilaian_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const RatingAplikasiScreen(),

      routes: {
        '/terimakasih_rating': (context) => const TerimakasihPenilaianScreen(),
      },
    );
  }
}
