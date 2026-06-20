import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
import 'package:mykurir/pages/permintaanPesanan/components/body.dart';

class PermintaanPesananScreen extends StatelessWidget {
  const PermintaanPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoadingController());
    Get.lazyPut(() => PengirimanController());
    return const Scaffold(body: Body());
  }
}
