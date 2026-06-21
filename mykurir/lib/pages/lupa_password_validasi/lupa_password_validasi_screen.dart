import 'package:get/get.dart';
import 'package:mykurir/pages/lupa_password_validasi/components/body.dart';
import 'package:flutter/material.dart';

class LupaPasswordValidasiScreen extends StatefulWidget {
  const LupaPasswordValidasiScreen({super.key});

  @override
  State<LupaPasswordValidasiScreen> createState() =>
      _LupaPasswordValidasiScreenState();
}

class _LupaPasswordValidasiScreenState
    extends State<LupaPasswordValidasiScreen> {
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
