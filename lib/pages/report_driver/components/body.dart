import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list driver dipisah agar kode UI lebih bersih
    final List<Map<String, String>> drivers = [
      {'name': 'Ridho Ari', 'date': '10/01/2026'},
      {'name': 'Daffa Setiawan', 'date': '15/01/2026'},
      {'name': 'Toto', 'date': '27/01/2026'},
      {'name': 'Tegar Hakim', 'date': '07/02/2026'},
      {'name': 'Budi Siregar', 'date': '15/02/2026'},
      {'name': 'Andi Santoso', 'date': '19/02/2026'},
      {'name': 'Diki Fahri', 'date': '25/02/2026'},
      {'name': 'Supri Wicaksono', 'date': '13/02/2026'},
      {'name': 'Galih Raharjo', 'date': '30/04/2026'},
      {'name': 'Hendra Kusuma', 'date': '11/05/2026'},
    ];

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
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
                  "Back",
                  style: GoogleFonts.inter(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // --- DAFTAR DRIVER ---
          Expanded(
            child: ListView.separated(
              itemCount: drivers.length,
              // Divider dibuat tanpa margin/translate agar tidak memakan tempat
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black87,
                thickness: 1.0,
                height: 1.0, // Kunci jarak antar item tetap rapat
              ),
              itemBuilder: (context, index) {
                final driver = drivers[index];
                return ListTile(
                  // Kombinasi properti ini yang membuat teks sangat mepet
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -4),
                  minVerticalPadding: 0,
                  
                  title: Text(
                    driver['name']!,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF232323),
                    ),
                  ),
                  subtitle: Text(
                    'Driver - ${driver['date']}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF232323),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF232323),
                    size: 24.0,
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}