import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  // Parameter yang diterima dari parent widget
  final TextEditingController phoneController;
  final bool isButtonActive;
  final ValueChanged<String> onPhoneChanged;
  final VoidCallback onSendPressed;

  const Body({
    super.key,
    required this.phoneController,
    required this.isButtonActive,
    required this.onPhoneChanged,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // --- Header (Tombol Back & Judul) ---
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
                    'Verifikasi Akun',
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
                'Masukan Nomor HP (WhatsApp) untuk verifikasi akun dan berkomunikasi',
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
                      'assets/icons/teleponmerahbesar.svg',
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Judul Seksi ---
              Text(
                'Nomor HP Aktif',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2E2E2E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Masukan Nomor HP yang terhubung di WhatsApp untuk menerima kode OTP.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2E2E2E),
                ),
              ),
              const SizedBox(height: 24),

              // --- Form Input Nomor Telepon ---
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
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF9E9E9E)),
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: onPhoneChanged, // Menggunakan callback dari parent
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    hintText: '6281234567890',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Contoh : 62812345678900',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2E2E2E),
                ),
              ),
              const SizedBox(height: 24),

              // --- Info Box Hijau ---
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFB4FFAE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 18,
                      color: Color(0xFF2E2E2E),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Kode OTP dikirim via WhatsApp, bukan SMS. Pastikan Nomor aktif di WhatsApp',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // --- Tombol Kirim ---
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isButtonActive ? onSendPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonActive
                        ? const Color(0xFFE31E24)
                        : const Color(0xFFFEFEFE),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Kirim Kode OTP',
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
    );
  }
}
