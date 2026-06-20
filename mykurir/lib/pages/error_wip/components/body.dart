import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ==========================================
      // STACK: Untuk memisahkan lapisan atas (Ikon) 
      // dan lapisan tengah (Gambar & Teks)
      // ==========================================
      body: Stack(
        children: [
          
          // --- LAPISAN 1: KONTEN DI TENGAH ---
          Align(
            alignment: const Alignment(0, -0.3), // Mengatur posisi ke tengah agak ke atas
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gambar
                Image.asset(
                  'assets/mdi_connection_wip.png',
                  width: 100, 
                  height: 100, 
                ),
                
                const SizedBox(height: 24),

                // Judul
                Text(
                  "Page is not exist", 
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                // Subtitle
                Text(
                  "Halaman masih dalam tahap pengembangan!!!", 
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // --- LAPISAN 2: IKON X DI POJOK KIRI ATAS ---
          // SafeArea digunakan agar ikon tidak menabrak status bar HP (jam/sinyal)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 38, 
                left: 15
                ), // Atur jarak dari tepi layar di sini
              child: IconButton(
                icon: const Icon(
                  Icons.cancel_outlined, // Menggunakan ikon X silang bawaan Flutter
                  color: Colors.black, 
                  size: 24,
                ),
                onPressed: () {
                  Navigator.pop(context); // Fungsi untuk kembali
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}