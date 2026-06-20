import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifikasiOtpGantiNoHp extends StatelessWidget {
  const VerifikasiOtpGantiNoHp ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Agar elemen rata kiri
              children: [
                // --- 1. BAGIAN HEADER ---
                _buildHeader(context),
                const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
             child: Transform.translate(
              offset: Offset(29, 0),   // --- 2. TEKS INSTRUKSI ---
                child: Text(
                  "Masukan kode OTP yang sudah kita kirim ke email anda", // <-- KETIK TEKS INSTRUKSI LENGKAP DI SINI
                  style: GoogleFonts.poppins(
                    fontSize: 16, 
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
             ),
          ),
                const SizedBox(height: 40),

                // --- 3. AREA TIMER ---
                _buildTimer(),
                const SizedBox(height: 30),

                // --- 4. KOTAK INPUT 6 DIGIT OTP ---
                _buildOtpInputs(),
                const SizedBox(height: 20),

                // --- 5. LINK KIRIM ULANG ---
                _buildResendCode(),
                const SizedBox(height: 40),

                // --- 6. TOMBOL UTAMA ---
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // =========================================================================
  // KUMPULAN WIDGET KERANGKA (Isi Teks Manual di Dalam Sini)
  // =========================================================================

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: Offset(-9, 0),
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFDA251D)), // Warna merah khas desainmu
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ), 
        const SizedBox(width: 10),
        Transform.translate(
          offset: Offset(-26, 0),
        child: Text(
          "Ganti Nomor Telepon", // <-- KETIK JUDUL HALAMAN DI SINI
          style: GoogleFonts.poppins(
            fontSize: 22, 
            fontWeight: FontWeight.bold, 
            color: Color(0xFFDA251D), 
          ),
        ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return Center(
      child: Column(
        children: [
          Text(
            "Kode Kadaluwarsa dalam", // <-- KETIK LABEL TIMER DI SINI
            style: GoogleFonts.poppins(
              fontSize: 14, 
              color: Colors.black87
              ),
          ),
          SizedBox(height: 8),
          Text(
            "02 : 00", // <-- KETIK ANGKA TIMER DI SINI
            style: GoogleFonts.poppins(
              fontSize: 36, 
              fontWeight: FontWeight.bold, 
              color: Color(0xFFDA251D),
              letterSpacing: 2.0, // Memberi jarak sedikit antar angka agar persis di desain
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpInputs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) {
          return SizedBox(
            width: 45,
            height: 55, // Dibuat sedikit lebih tinggi agar kotak terlihat memanjang ke bawah
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: GoogleFonts.poppins(
                fontSize: 20, 
                fontWeight: FontWeight.bold
                ),
              decoration: InputDecoration(
                counterText: "", // Menghilangkan teks penghitung angka di bawah kotak
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFDA251D), width: 1.5), // Berubah merah saat diklik
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResendCode() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tidak menerima kode ? ", // <-- KETIK TEKS PERTANYAAN DI SINI
            style: GoogleFonts.poppins(
              fontSize: 14, 
              color: Colors.black87),
          ),
          GestureDetector(
            onTap: () {
              // Aksi saat klik kirim ulang
            },
            child: Text(
              "Kirim ulang", // <-- KETIK TEKS TOMBOL LINK DI SINI
              style: GoogleFonts.poppins(
                fontSize: 14, 
                color: Color(0xFFDA251D), 
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDA251D), // Merah Solid
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          // Aksi tombol kirim
        },
        child: Text(
          "Kirim", // <-- KETIK TEKS TOMBOL UTAMA DI SINI
          style: GoogleFonts.poppins(
            color: Colors.white, 
            fontSize: 16, 
            fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}