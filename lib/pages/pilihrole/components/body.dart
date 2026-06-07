import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: Color(0xFF9E1217),
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Selamat datang! Silakan pilih peran anda\n untuk memulai.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF5A5A5A),
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
                  fontWeight: FontWeight.w600,
                ),
                subtitle: 'Pesan barang dari rumah\ndengan mudah',
                onTap: () {
                  // TODO: navigate to login/register as pengguna
                },
              ),
              const SizedBox(height: 16),
              // Card Driver
              _RoleCard(
                assetIcon: 'assets/icons/IconDriver.svg',
                title: 'Driver',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                subtitle:
                    'Join menjadi kurir mitra\n"MyKurir" untuk\nmenghasilkan uang.',
                onTap: () {
                  // TODO: navigate to login/register as driver
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red[200]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
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
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
