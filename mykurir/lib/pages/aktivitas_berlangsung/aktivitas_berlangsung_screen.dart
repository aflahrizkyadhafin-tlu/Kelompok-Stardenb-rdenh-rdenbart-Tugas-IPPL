import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
import 'package:mykurir/pages/aktivitas_berlangsung/components/body.dart';
import 'package:flutter/material.dart';

class AktivitasBerlangsungScreen extends StatefulWidget {
  const AktivitasBerlangsungScreen({super.key});

  @override
  State<AktivitasBerlangsungScreen> createState() =>
      _AktivitasBerlangsungScreenState();
}

class _AktivitasBerlangsungScreenState
    extends State<AktivitasBerlangsungScreen> {
  final PengirimanController _pengirimanController = Get.put(
    PengirimanController(),
  );
  final AkunController _akunController = Get.put(AkunController());

  @override
  void initState() {
    super.initState();
    _pengirimanController.riwayatPengiriman(
      _akunController.profileAkun.value!.idAkun.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
