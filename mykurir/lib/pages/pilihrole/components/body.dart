import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';
import 'package:mykurir/models/akun.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingController loadingController = Get.find();
    AuthController authController = Get.find();

    final args = Get.arguments;

    return Scaffold(
      backgroundColor: Color(0xFF9E1217),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              // Logo / Title
              Text(
                'MyKurir',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFEFEFE),
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Selamat datang! Silakan pilih peran anda untuk memulai.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFEFEFE),
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 60),
              // Card Pengguna
              _RoleCard(
                assetIcon: 'assets/icons/IconPengguna.svg',
                title: 'Pengguna',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Color(0xFF1A1C1C),
                  fontWeight: FontWeight.w600,
                ),
                subtitle: 'Pesan barang dari rumah dengan mudah',
                onTap: () {
                  authController.registerData.role = UserRole.pengguna;
                  loadingController.show();
                  authController.register();
                  Get.toNamed("/verif_otp", arguments: args);
                },
              ),
              const SizedBox(height: 16),
              // Card Driver
              _RoleCard(
                assetIcon: 'assets/icons/IconDriver.svg',
                title: 'Driver',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Color(0xFF1A1C1C),
                  fontWeight: FontWeight.w600,
                ),
                subtitle:
                    'Join menjadi kurir mitra "MyKurir" untuk menghasilkan uang.',
                onTap: () {
                  authController.registerData.role = UserRole.kurir;
                  loadingController.show();
                  authController.register();
                  Get.toNamed("/verif_otp", arguments: args);
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String? assetIcon;
  final String title;
  final TextStyle? style;
  final String subtitle;
  final VoidCallback onTap;

  const _RoleCard({
    this.assetIcon,
    required this.title,
    this.style,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          border: Border.all(color: Colors.red[200]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: assetIcon != null
                  ? (assetIcon!.endsWith('.svg')
                        ? SvgPicture.asset(assetIcon!, width: 56, height: 56)
                        : Image.asset(assetIcon!, width: 56, height: 56))
                  : const Icon(Icons.person, color: Colors.red, size: 28),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style:
                        style ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF5F5E5E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
