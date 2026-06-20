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

                    onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      isScrollControlled: true, // Memastikan layout menyesuaikan konten dengan baik
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // Sudut atas lebih membulat
                      ),
                      builder: (context) {
                        
                        // Daftar teks untuk list pilihan (Silakan ubah teksnya secara manual di sini)
                        final List<String> listPilihan = [
                          'Kurir terlambat berlebihan',
                          'Barang Hilang/Rusak',
                          'Kurir tidak sopan',
                          'Kurir meminta bayaran diluar aplikasi',
                          'Kurir sulit dihubungi',
                          'Orderan selesai padahal barang belum diterima'
                        ];

                        return SizedBox(
                          height: 553,
                          child :Padding(
                            padding: const EdgeInsets.only(
                            top: 24,
                            left: 20,
                            right: 20,
                            bottom: 30, // Jarak ekstra di bawah
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min, // Tinggi overlay menyesuaikan isinya
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              // --- 1. BAGIAN HEADER (Tombol X dan Judul Tengah) ---
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  // Tombol Silang (X) di kiri
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
                                  // Teks Judul & Subjudul di tengah
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child : Column(
                                      children: [
                                        Text(
                                          'Lapor Akun', // Isi manual
                                          style: GoogleFonts.inter(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Laporan anda akan bersifat anonim', // Isi manual
                                        style: GoogleFonts.inter(
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

                              // --- 2. JUDUL BAGIAN LIST ---
                              Text(
                                'Alasan Lapor', // Isi manual
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              
                              const SizedBox(height: 10),

                              // --- 3. DAFTAR PILIHAN BERSERTA GARIS BAWAH ---
                              ...listPilihan.map((text) {
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true, // Membuat tinggi item lebih rapat
                                      title: Text(
                                        text,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios, // Ikon panah ke kanan
                                        size: 18,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        // Tambahkan aksi saat pilihan diklik di sini
                                      },
                                    ),
                                    const Divider(
                                      color: Colors.black87,
                                      thickness: 1.0,
                                      height: 1.0,
                                              ),
                                            ],
                                          );
                                        }), // Tidak perlu .toList() karena sudah menggunakan spread operator (...)
                                      ],
                                    ),
                          ),
                                  );
                                },
                              );
                            },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

          