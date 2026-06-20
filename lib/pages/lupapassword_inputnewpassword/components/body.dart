import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_flutter/icons_flutter.dart';

class LupaPasswordInputNewPasswordScreen extends StatelessWidget {
  const LupaPasswordInputNewPasswordScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // --- PERBAIKAN: DIBUNGKUS SINGLECHILDSCROLLVIEW ---
        child: SingleChildScrollView(
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
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF9E1217),
                        size: 22.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Lupa Password",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9E1217),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // --- 2. TEKS INSTRUKSI (SUBTITLE) ---
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Silahkan isi kata sandi baru anda",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- 3. AREA INPUT PASSWORD ---
                _buildPasswordInput(
                  label: "Password Baru",
                  icon: Feather.lock,
                  ),
                const SizedBox(height: 20),

                _buildPasswordInput(
                  label: "Konfirmasi Password Baru",
                  icon: Feather.mail,
                  ),
                const SizedBox(height: 20),

                // --- 4. TOMBOL UTAMA ---
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE3242B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Aksi saat tombol ditekan
                    },
                    child: Text(
                      "Selesai",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================
  // FUNGSI BARU: PEMBUAT KOTAK INPUT PASSWORD
  // =========================================================
  Widget _buildPasswordInput({required String label, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(15, 0),
          child: Row(
            children: [
              // --- PERBAIKANNYA DI SINI ---
              Icon(
                icon,
                size: 17,
                color: Colors.black,
              ),
              // ----------------------------
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ], // <-- Perbaikan: Menambahkan penutup array children
          ),   // <-- Perbaikan: Menambahkan penutup Row
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: true, // Membuat teks jadi titik-titik
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            // Ikon mata di sebelah kanan kotak
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                // Aksi untuk melihat/menyembunyikan password
              },
            ),
          ),
        ),
      ],
    );
  }
}