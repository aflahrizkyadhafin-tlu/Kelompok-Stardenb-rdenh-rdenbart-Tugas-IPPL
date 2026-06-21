import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
// import 'package:icons_flutter/icons_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. HEADER (TOMBOL KEMBALI & JUDUL) ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Fungsi tombol kembali
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff9E1217), // Warna ikon kembali
                      size: 22.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Lupa Password", // <-- KETIK JUDUL DI SINI
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff9E1217), // Warna teks judul
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // --- 2. TEKS INSTRUKSI (SUBTITLE) ---
              Padding(
                // Memberikan jarak kiri agar sejajar dengan teks judul, bukan ikon
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Silahkan isi alamat email anda yang terdaftar untuk verifikasi bahwa akun ini milik anda", // <-- KETIK SUBTITLE DI SINI
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // --- 3. LABEL INPUT ---
              Transform.translate(
                offset: Offset(15, 0),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline, color: Colors.black, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "Email", // <-- KETIK LABEL EMAIL DI SINI
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // --- 4. KOTAK INPUT (TEXTFIELD) ---
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 55),

              // --- 5. TOMBOL UTAMA ---
              SizedBox(
                width:
                    double.infinity, // Membuat tombol penuh memanjang ke kanan
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFE3242B,
                    ), // Warna merah tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    authController.isLoading.value = true;
                    authController.resetPasswordOTP(
                      emailController.text.trim(),
                    );
                    Get.toNamed(
                      "/verif_otp",
                      arguments: {
                        "email": emailController.text.trim(),
                        "type": "recovery",
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verifikasi", // <-- KETIK TEKS TOMBOL DI SINI
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
