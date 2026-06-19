import 'package:flutter/material.dart';
//import 'package:frontend/pages/masukNoHP/masukNoHP_screen.dart';
//import 'package:frontend/pages/setting/setting_screen.dart';
// import 'package:frontend/pages/pesanan/pesanan_screen.dart';
// import 'package:frontend/pages/login/login_screen.dart';
//import 'package:frontend/pages/daftar/daftar_screen.dart';
import 'package:frontend/pages/profil/profil_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProfilScreen());
  }
}
