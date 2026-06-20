import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportCustomerOverlay extends StatelessWidget {
  const ReportCustomerOverlay({super.key});

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
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                  onPressed: () => Navigator.pop(context),
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

                      // ===============================================
                      // SANGAT SIMPEL! Cuma butuh panggil nama fungsinya
                      // ===============================================
                      onTap: () => _tampilkanOverlayLapor(context),
                    ),
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

  // =========================================================================
  // FUNGSI OVERLAY DIPISAH KE BAWAH SINI AGAR TIDAK MENGGANGGU KODE UTAMA
  // =========================================================================
  void _tampilkanOverlayLapor(BuildContext context) {
    final List<String> listPilihan = [
      'Penerima tidak dapat / sulit dihubungi',
      'Perilaku tidak menyenangkan',
      'Pengguna tidak membayar sesuai aplikasi',
      'Titik Pengantaran Tidak Sesuai',
      'Ukuran paket tidak sesuai',
      'Membatalkan Pesanan secara Sepihak',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return SizedBox(
          height: 553,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- HEADER OVERLAY ---
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 26,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Text(
                            'Lapor Akun',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Laporan anda akan bersifat anonim',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 45),

                Text(
                  'Alasan Lapor',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // --- DAFTAR ALASAN ---
                ...listPilihan.map((text) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          text,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                        onTap: () {},
                      ),
                      const Divider(
                        color: Colors.black87,
                        thickness: 1.0,
                        height: 1.0,
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
