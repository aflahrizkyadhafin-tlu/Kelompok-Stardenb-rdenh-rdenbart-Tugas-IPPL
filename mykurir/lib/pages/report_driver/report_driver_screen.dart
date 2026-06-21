import 'package:mykurir/pages/report_driver/components/body.dart';
import 'package:flutter/material.dart';

class ReportDriverScreen extends StatelessWidget {
  const ReportDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Body()));
  }
}
