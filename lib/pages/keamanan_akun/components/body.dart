import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeamananAkunPage extends StatelessWidget {
  const KeamananAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                 child: Text (
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
          colors: [
            Color(0xFFC62828), 
            Color(0xFFFFCDD2), 
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child : Transform.translate(
        offset: Offset(0, -25),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.arrow_back_ios, 
              color: Colors.black87, 
              size: 20
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
              color: Color(0xFF2E2E2E)
              ),  
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGantiEmail() {
    return _buildListItemTemplate(
      icon: Icons.email_outlined,
      title: "Ganti Email",
      subtitle: "Email saat ini : nad****@gmail.com",
      onTap: () {
        
      },
    );
  }

  Widget _buildMenuGantiPassword() {
    return _buildListItemTemplate(
      icon: Icons.lock_outline,
      title: "Ganti Password",
      subtitle: "Ganti password saat ini",
      onTap: () {
        // ISI MANUAL: Aksi saat klik ganti password
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
              color: Colors.black87
              ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12, 
              color: Colors.black54
              ),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.black54),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.black87, 
          thickness: 1.0, 
          height: 1.0),
        const SizedBox(height: 8),
      ],
    );
  }
}