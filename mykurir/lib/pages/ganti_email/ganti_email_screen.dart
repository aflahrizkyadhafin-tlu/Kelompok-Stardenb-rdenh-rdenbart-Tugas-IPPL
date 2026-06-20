import 'package:flutter/material.dart';
import 'package:mykurir/pages/ganti_email/components/body.dart';

class GantiEmailScreen extends StatelessWidget {
  const GantiEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Body()));
  }
}
