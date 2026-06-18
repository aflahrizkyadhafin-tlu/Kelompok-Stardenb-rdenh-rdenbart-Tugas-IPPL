import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Deklarasi List Controller dan FocusNode untuk 6 digit OTP
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool _isButtonActive = false;

  // Deklarasi State untuk Timer Kadaluwarsa
  Timer? _timer;
  int _startWaktu = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Mencegah kebocoran memori
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // Menjalankan Timer hitungan mundur
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

  // Helper ubah detik jadi format MM : SS
  String get _timerString {
    int menit = _startWaktu ~/ 60;
    int detik = _startWaktu % 60;
    return "${menit.toString().padLeft(2, '0')} : ${detik.toString().padLeft(2, '0')}";
  }

  // Cek 6 kotak OTP sudah terisi semua
  void _checkOtpFull() {
    bool isFull = true;
    for (var controller in _otpControllers) {
      if (controller.text.trim().isEmpty) {
        isFull = false;
        break;
      }
    }
    setState(() {
      _isButtonActive = isFull;
    });
  }

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
                      Navigator.pop(context); // Back ke halaman Verif Akun
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

              // --- Ikon Kotak Merah Muda (Chat/Pesan) ---
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
                      _timerString,
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
                      border: Border.all(color: const Color(0xFF2E2E2E)),
                    ),
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      // INPUT HANYA BISA ANGKA
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        _checkOtpFull();
                        if (value.isNotEmpty && index < 5) {
                          // Pindah ke kotak kanan jika diisi
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index + 1]);
                        } else if (value.isEmpty && index > 0) {
                          // Pindah ke kotak kiri jika dihapus
                          FocusScope.of(
                            context,
                          ).requestFocus(_focusNodes[index - 1]);
                        }
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
                          ..onTap = () {
                            // Aksi ketika tombol "Kirim ulang" diklik
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // --- Display Nomor Telepon (Disabled State) ---
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
                    '62812345678900', // Mock data
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: const Color(0xFF8A8A8A),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Back ke halaman input nomor
                },
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
                  onPressed: _isButtonActive
                      ? () {
                          String kodeOtp = _otpControllers
                              .map((e) => e.text)
                              .join();
                          debugPrint("Memverifikasi OTP: $kodeOtp");
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonActive
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
                      color: _isButtonActive
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
