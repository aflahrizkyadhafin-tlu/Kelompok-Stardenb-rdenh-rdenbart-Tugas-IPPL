import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/laporan_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    LaporanController _laporanController = Get.put(LaporanController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => _laporanController.isLoading.value
            ? LoadingScreen()
            : Align(
                alignment: const Alignment(0, -0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ikon ceklis hijau (verified badge)
                    Image.asset("assets/icons/password_change_valid_icon.png"),
                    Text(
                      "Thank you!",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Judul / Pesan Utama
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 27.0,
                      ),
                      child: Text(
                        "Laporan berhasil terkirim. Terimakasih telah memberi tahu kami. Kami menggunakan masukan anda untuk membantu sistem kami. Tim kami akan meninjau dalam 1x24 jam", // <- Tulis disini: judul/pesan utama, contoh "Akun Anda berhasil dihapus"
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
      ),
    );
  }
}
