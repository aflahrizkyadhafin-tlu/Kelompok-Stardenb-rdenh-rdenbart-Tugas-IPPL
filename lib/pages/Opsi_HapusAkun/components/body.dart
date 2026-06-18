import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,  
        right: 20, 
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN HEADER ---
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_ios, 
                      color: Color(0xFF2E2E2E),
                      size: 21,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-18, 0),
                  child: Text(
                    "Hapus Akun", 
                    style: GoogleFonts.inter(
                      fontSize: 19, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFFA01515),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 5),

            Transform.translate(
              offset: const Offset(0.0, -7.0),
              child: Divider(
                color: Colors.black87,
                thickness: 1.5,
                indent: 2,
                endIndent: 0,
              ),
            ),

            const SizedBox(height: 12),

            // --- MENU 1: HAPUS AKUN ---
            Transform.translate(
              offset: const Offset(0, -10),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFF232323),
                  size: 32.0, // ✏️ 28 → 32
                ),
                title: Text(
                  'Hapus Akun',
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF232323),
                  ),
                ),
                subtitle: Text(
                  'Akun anda akan dihapus permanen',
                  style: GoogleFonts.inter(
                    fontSize: 13.0,
                    color: Color(0xFF232323),
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF232323),
                  size: 28.0,
                ),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 10), // ✏️ tambah jarak antar menu

            // --- MENU 2: KELUAR AKUN ---
            Transform.translate(
              offset: const Offset(0, -10),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFF232323),
                  size: 32.0, // ✏️ 28 → 32
                ),
                title: Text(
                  'Keluar Akun',
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF232323),
                  ),
                ),
                subtitle: Text(
                  'Anda hanya keluar dari akun',
                  style: GoogleFonts.inter(
                    fontSize: 13.0,
                    color: Color(0xFF232323),
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF232323),
                  size: 28.0,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}