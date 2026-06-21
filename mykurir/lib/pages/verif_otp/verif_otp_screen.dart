import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/pages/verif_otp/components/body.dart'; // Sesuaikan path-nya

class VerifOtpScreen extends StatefulWidget {
  const VerifOtpScreen({super.key});

  @override
  State<VerifOtpScreen> createState() => _VerifOtpScreenState();
}

class _VerifOtpScreenState extends State<VerifOtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool _isButtonActive = false;
  Timer? _timer;
  int _startWaktu = 120;
  final AuthController authController = Get.put(AuthController());
  final LoadingController loadingController = Get.put(LoadingController());
  final args = Get.arguments;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startWaktu == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _startWaktu--;
        });
      }
    });
  }

  String get _timerString {
    int menit = _startWaktu ~/ 60;
    int detik = _startWaktu % 60;
    return "${menit.toString().padLeft(2, '0')} : ${detik.toString().padLeft(2, '0')}";
  }

  void _handleOtpChange(int index, String value) {
    // Cek 6 kotak terisi penuh
    bool isFull = _otpControllers.every(
      (controller) => controller.text.trim().isNotEmpty,
    );
    setState(() {
      _isButtonActive = isFull;
    });

    // Pindah Kotak Otomatis
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        otpControllers: _otpControllers,
        focusNodes: _focusNodes,
        isButtonActive: _isButtonActive,
        timerString: _timerString,
        phoneNumber: authController
            .registerData
            .nomorTelepon, // Nantinya bisa di-passing dari halaman login
        onOtpChanged: _handleOtpChange,
        onResendPressed: () {
          debugPrint("Kirim Ulang OTP");
        },
        onChangePhonePressed: () {
          Navigator.pop(context);
        },
        onVerifyPressed: () async {
          String kodeOtp = _otpControllers.map((e) => e.text).join();
          debugPrint("Memverifikasi OTP: $kodeOtp");
          loadingController.show();
          final bool verifOTP = args["type"] == "telepon"
              ? await authController.verifOTPTelepon(kodeOtp)
              : args["type"] == "recovery"
              ? await authController.verifChangePassword(kodeOtp, args["email"])
              : args["type"] == "changeEmail"
              ? await authController.verifyOTPChangeEmail(
                  args["email"],
                  kodeOtp,
                )
              : await authController.verifOTPEmail(kodeOtp);
          if (verifOTP) {
            authController.registerData = RegisterPayload();
            Get.snackbar("Verifikasi OTP", "Verifikasi OTP berhasil");
          }
          // TODO: Navigasi jika berhasil
        },
      ),
    );
  }
}
