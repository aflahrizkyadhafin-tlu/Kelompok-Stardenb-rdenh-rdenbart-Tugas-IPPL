import 'package:flutter/material.dart';
import 'package:mykurir/pages/ganti_password/components/body.dart';

class GantiPasswordScreen extends StatelessWidget {
  const GantiPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Body()));
  }
}
