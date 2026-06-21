import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/pages/pilih_role/components/body.dart';

class PilihroleScreen extends StatelessWidget {
  const PilihroleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    return Scaffold(body: Body());
  }
}
