import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/lengkunganmerahbg.svg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 80,
                child: Text(
                  'Pusat Bantuan',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryTitle('Umum'),
                const SizedBox(height: 8),
                _buildMenuItem('Kelola Data & Profil Akun', onTap: () {}),
                _buildMenuItem('Keamanan akun', onTap: () {}),
                _buildMenuItem('Daftar Menjadi Driver', onTap: () {}),
                _buildMenuItem('Order Driver', onTap: () {}),
                _buildMenuItem('Hapus Akun', onTap: () {}),

                const SizedBox(height: 32),

                _buildCategoryTitle('Layanan Kami'),
                const SizedBox(height: 8),
                _buildMenuItem('Hubungi Kami via WhatsApp', onTap: () {}),

                const SizedBox(height: 32),

                _buildCategoryTitle('Tentang Aplikasi'),
                const SizedBox(height: 8),
                _buildMenuItem('Versi & Informasi Aplikasi', onTap: () {}),
                _buildMenuItem('Kebijakan & Ketentuan', onTap: () {}),

                const SizedBox(height: 60),

                Center(
                  child: Text(
                    'Copyright @ stardenburdenhardenbart 04',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF9E9E9E),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF2E2E2E),
      ),
    );
  }

  Widget _buildMenuItem(String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
