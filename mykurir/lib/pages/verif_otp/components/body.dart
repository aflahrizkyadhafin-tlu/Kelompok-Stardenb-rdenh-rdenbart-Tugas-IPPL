import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';

class Body extends StatelessWidget {
  // Semua state dan fungsi dilempar dari Parent
  final List<TextEditingController> otpControllers;
  final List<FocusNode> focusNodes;
  final bool isButtonActive;
  final String timerString;
  final String phoneNumber; // Agar nomor telepon bisa dinamis
  final void Function(int index, String value) onOtpChanged;
  final VoidCallback onResendPressed;
  final VoidCallback onChangePhonePressed;
  final VoidCallback onVerifyPressed;

  const Body({
    super.key,
    required this.otpControllers,
    required this.focusNodes,
    required this.isButtonActive,
    required this.timerString,
    required this.phoneNumber,
    required this.onOtpChanged,
    required this.onResendPressed,
    required this.onChangePhonePressed,
    required this.onVerifyPressed,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: Obx(
        () => authController.isLoading.value
            ? LoadingScreen()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      // --- Header ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF9E1217),
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Verifikasi Kode OTP',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF9E1217),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kode OTP yang sudah diterima di WhatsApp',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // --- Ikon Kotak Merah Muda ---
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Transform.translate(
                            offset: const Offset(0, 16),
                            child: SvgPicture.asset(
                              'assets/icons/iconmessageotp.svg',
                              width: 55,
                              height: 55,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Judul Seksi ---
                      Text(
                        'Kode OTP',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Masukan 6 digit Kode OTP yang sudah kita kirim.',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Tampilan Timer Kadaluwarsa ---
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'Kode Kadaluwarsa dalam',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              timerString, // Pakai data dari parameter
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF9E1217),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- 6 Digit Kotak Input OTP ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return Container(
                            width: 46,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                            child: TextField(
                              controller: otpControllers[index],
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF000000),
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: "",
                              ),
                              onChanged: (value) {
                                // Memanggil fungsi dari Parent
                                onOtpChanged(index, value);
                              },
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),

                      // --- Teks Kirim Ulang ---
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF2E2E2E),
                            ),
                            children: [
                              const TextSpan(text: 'Tidak menerima kode ? '),
                              TextSpan(
                                text: 'Kirim ulang',
                                style: const TextStyle(
                                  color: Color(0xFFE31E24),
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onResendPressed,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // --- Display Nomor Telepon ---
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/teleponhitamkecil.svg',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Nomor Telepon',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: const Color(0xFF5A5A5A),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF9E9E9E)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            phoneNumber, // Pakai parameter agar dinamis
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFF8A8A8A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: onChangePhonePressed,
                        child: Text(
                          'Ubah Nomor Telepon',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF9E1217),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // --- Tombol Verifikasi Kode OTP ---
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: isButtonActive ? onVerifyPressed : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButtonActive
                                ? const Color(0xFFE31E24)
                                : const Color(0xFFD9D9D9),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Verifikasi Kode OTP',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: isButtonActive
                                  ? const Color(0xFFFEFEFE)
                                  : const Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
