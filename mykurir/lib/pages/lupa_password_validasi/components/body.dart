import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/auth_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => !_authController.isLoading.value
            ? LoadingScreen()
            : Align(
                alignment: const Alignment(0, -0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Ikon ceklis hijau (verified badge)
                    Image.asset("assets/icons/password_change_valid_icon.png"),
                    const SizedBox(height: 24),

                    // Judul / Pesan Utama
                    Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 27.0,
                      ),
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
      ),
    );
  }
}
