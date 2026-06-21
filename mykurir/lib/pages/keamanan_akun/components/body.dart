import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/auth_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- 1. BAGIAN HEADER (Gradient Merah) ---
          _buildHeader(context),

          // --- 2. BAGIAN KONTEN BAWAH ---
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Transform.translate(
                  offset: Offset(0, 15),
                  child: Text(
                    "Data Pribadi", // ISI MANUAL: Sesuaikan font style-nya
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- 3. DAFTAR MENU ---
                _buildMenuGantiEmail(),
                _buildMenuGantiPassword(),
                _buildMenuGantiNomor(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================================
  // KUMPULAN WIDGET DIPISAH KE SINI AGAR KODE UTAMA SANGAT BERSIH
  // =========================================================================

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
      decoration: const BoxDecoration(
        // ISI MANUAL: Sesuaikan warna gradient merahnya
        gradient: LinearGradient(
          colors: [Color(0xFFC62828), Color(0xFFFFCDD2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Transform.translate(
        offset: Offset(0, -25),
        child: Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black87,
                size: 20,
              ),
              onPressed: () {
                // ISI MANUAL: Aksi kembali
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 10),
            Transform.translate(
              offset: Offset(-17, 0),
              child: Text(
                "Keamanan Akun", // ISI MANUAL: Sesuaikan font style-nya
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String maskEmail(String email) {
    List<String> parts = email.split('@');
    if (parts.length != 2) return email; // Return as is if invalid format

    String name = parts[0];
    String domain = parts[1];

    if (name.length <= 2) return email;

    String firstTwo = name.substring(0, 2);
    String lastTwo = name.substring(name.length - 2);
    String masked = '*' * (name.length - 4);

    return "$firstTwo$masked$lastTwo@$domain";
  }

  Widget _buildMenuGantiEmail() {
    final AuthController _authController = Get.find();
    return _buildListItemTemplate(
      icon: Icons.email_outlined,
      title: "Ganti Email",
      subtitle:
          "Email saat ini : ${maskEmail(_authController.detailUser.value!.email.toString())}",
      onTap: () {
        Get.toNamed("/ganti_email");
      },
    );
  }

  Widget _buildMenuGantiPassword() {
    final AuthController _authController = Get.find();

    return _buildListItemTemplate(
      icon: Icons.lock_outline,
      title: "Ganti Password",
      subtitle: "Ganti password saat ini",
      onTap: () {
        Get.toNamed("/ganti_password");
      },
    );
  }

  Widget _buildMenuGantiNomor() {
    return _buildListItemTemplate(
      icon: Icons.phone_android_outlined,
      title: "Ganti Nomor Telepon",
      subtitle: "Ganti nomor telepon saat ini",
      onTap: () {
        // ISI MANUAL: Aksi saat klik ganti nomor
      },
    );
  }

  // --- TEMPLATE DASAR UNTUK LIST ITEM (AGAR TIDAK COPAS BERULANG-ULANG) ---
  Widget _buildListItemTemplate({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: Colors.black87),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: onTap,
        ),
        const Divider(color: Colors.black87, thickness: 1.0, height: 1.0),
        const SizedBox(height: 8),
      ],
    );
  }
}
