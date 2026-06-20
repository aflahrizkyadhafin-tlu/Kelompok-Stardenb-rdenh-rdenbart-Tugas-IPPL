import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/bxs.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
// Tambahkan import package MDI di sini

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
            // Ikon connection menggunakan MDI
            Iconify(Bxs.plug, color: Colors.black, size: 100),
            const SizedBox(height: 24),

            // Judul / Pesan Utama
            Text(
              "Connection Error", // <- Tulis disini: judul/pesan utama
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),

            // Subtitle / Pesan Tambahan
            Text(
              "Ups! sepertinya kamu memiliki kendala internet silahkan hubungkan ulang!", // <- Tulis disini: subtitle/pesan tambahan
              style: GoogleFonts.inter(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
