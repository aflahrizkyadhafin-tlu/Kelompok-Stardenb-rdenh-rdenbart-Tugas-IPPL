import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GantiNomorHpScreen extends StatelessWidget {
  const GantiNomorHpScreen ({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red, // Warna ikon kembali
                      size: 22.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Ganti Nomor Telepon", // <-- KETIK JUDUL DI SINI
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Warna teks judul
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
                  "Silahkan masukkan Nomor Telepon anda yang baru", // <-- KETIK SUBTITLE DI SINI
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
              child: Text(
                "Nomor HP", // <-- KETIK LABEL EMAIL DI SINI
                style: GoogleFonts.poppins (
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
              const SizedBox(height: 8),

              // --- 4. KOTAK INPUT (TEXTFIELD) ---
              TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  hintText: "Contoh : 0812345678900",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              const SizedBox(height: 32),

              // --- 5. TOMBOL UTAMA ---
              SizedBox(
                width: double.infinity, // Membuat tombol penuh memanjang ke kanan
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3242B), // Warna merah tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Aksi saat tombol ditekan
                  },
                  child: Text(
                    "Selesai", // <-- KETIK TEKS TOMBOL DI SINI
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
    );
  }
}