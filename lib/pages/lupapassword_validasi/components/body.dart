import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: const Alignment(0, -0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ikon ceklis hijau (verified badge)
            const Icon(
              Icons.verified,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 24),

            // Judul / Pesan Utama
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 27.0),
            child: Text(
              "Kata sandi anda berhasil diperbarui, silahkan Login(Masuk) ulang", // <- Tulis disini: judul/pesan utama, contoh "Akun Anda berhasil dihapus"
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}