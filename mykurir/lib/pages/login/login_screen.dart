import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/pages/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => AuthController());

    return const Scaffold(body: Body());
  }
}
