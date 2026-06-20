import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/pages/profil/components/body.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AkunController());
    Get.lazyPut(() => AuthController());
    return const Scaffold(body: Body());
  }
}
