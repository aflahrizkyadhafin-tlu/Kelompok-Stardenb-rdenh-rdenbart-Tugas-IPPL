import 'package:get/get.dart';
import 'package:mykurir/pages/report_driver_success/components/body.dart';
import 'package:flutter/material.dart';

class ReportDriverSuccessScreen extends StatefulWidget {
  const ReportDriverSuccessScreen({super.key});

  @override
  State<ReportDriverSuccessScreen> createState() =>
      _ReportDriverSuccessScreenState();
}

class _ReportDriverSuccessScreenState extends State<ReportDriverSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
