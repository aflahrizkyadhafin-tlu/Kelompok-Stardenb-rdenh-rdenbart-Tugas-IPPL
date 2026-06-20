import 'package:get/get.dart';
import 'package:mykurir/pages/lupa_password_validasi/components/body.dart';
import 'package:flutter/material.dart';

class LupapasswordValidasiScreen extends StatefulWidget {
  const LupapasswordValidasiScreen({super.key});

  @override
  State<LupapasswordValidasiScreen> createState() =>
      _LupapasswordValidasiScreenState();
}

class _LupapasswordValidasiScreenState
    extends State<LupapasswordValidasiScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAllNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
