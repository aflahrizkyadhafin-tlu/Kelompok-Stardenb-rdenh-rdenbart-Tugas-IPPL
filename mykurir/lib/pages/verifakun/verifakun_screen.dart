import 'package:flutter/material.dart';
import 'package:mykurir/pages/verifakun/components/body.dart'; // Sesuaikan path

class VerifAkunScreen extends StatefulWidget {
  const VerifAkunScreen({super.key});

  @override
  State<VerifAkunScreen> createState() => _VerifAkunScreenState();
}

class _VerifAkunScreenState extends State<VerifAkunScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonActive = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Panggil widget Body dan isi parameternya
      body: Body(
        phoneController: _phoneController,
        isButtonActive: _isButtonActive,
        onPhoneChanged: (value) {
          // Fungsi ini akan dipanggil setiap kali user mengetik di TextField
          setState(() {
            _isButtonActive = value.trim().isNotEmpty;
          });
        },
        onSendPressed: () {
          // Fungsi ini akan dipanggil saat tombol diklik
          debugPrint("Mengirim OTP ke: ${_phoneController.text}");
          Navigator.pushNamed(context, '/otp_verification');
        },
      ),
    );
  }
}
