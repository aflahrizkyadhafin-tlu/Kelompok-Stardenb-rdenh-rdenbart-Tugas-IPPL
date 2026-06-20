import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list driver
    final List<Map<String, String>> drivers = [
      {'name': 'Razan Ikhsan', 'date': '17/01/2026'},
      {'name': 'Indra Lesmana', 'date': '19/01/2026'},
      {'name': 'Lily', 'date': '23/01/2026'},
      {'name': 'Anisa Putri', 'date': '05/02/2026'},
      {'name': 'Aditya Pratama', 'date': '10/02/2026'},
      {'name': 'Kayla Putri', 'date': '11/02/2026'},
      {'name': 'Gavin Pratama', 'date': '15/02/2026'},
      {'name': 'Raka Abimanyu', 'date': '20/02/2026'},
      {'name': 'Vivi', 'date': '10/03/2026'},
      {'name': 'Rian', 'date': '12/03/2026'},
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

          // --- DAFTAR CUSTOMER ---
          Expanded(
            // Menggunakan ListView.builder agar tiap item pasti punya garis bawah
            child: ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                
                return Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 14),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -3),
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
                        'Customer - ${driver['date']}',
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
                    ),
                    // Garis pembatas diletakkan langsung di bawah ListTile
                    const Divider(
                      color: Colors.black87,
                      thickness: 1.0,
                      height: 1.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}