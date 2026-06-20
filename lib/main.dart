import 'package:flutter/material.dart';
import 'package:frontendmykurir_rizqi/pages/daftarmitradriver5/mitradriver5_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MitraDriver5Screen(),
    );
  }
}
