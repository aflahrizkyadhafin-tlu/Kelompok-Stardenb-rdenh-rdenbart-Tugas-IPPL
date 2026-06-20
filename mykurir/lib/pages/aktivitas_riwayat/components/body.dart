import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:icons_flutter/icons_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =========================================================
      // MENU NAVIGASI BAWAH (Sesuai kode asli yang Anda berikan)
      // =========================================================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF9E1014),
            unselectedItemColor: Colors.black45,
            currentIndex: 1,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                label: 'Aktivitas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline),
                label: 'Bantuan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),

      // =========================================================
      // BAGIAN ISI HALAMAN (BODY)
      // =========================================================
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildToggleButtons(),
            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                children: [
                  // KARTU 1 (Data Dimas)
                  _buildKartuOrder(
                    isSukses: true,
                    tanggal: "22 April, 18:15",
                    namaPelanggan: "Dimas Saputra",
                    lokasiAwal: "Teluk",
                    lokasiTujuan: "Perumahan Arca",
                    harga: "Rp 12.000",
                  ),
                  const SizedBox(height: 16),

                  // KARTU 2 (Data Renisa) - Berbeda!
                  _buildKartuOrder(
                    isSukses: true,
                    tanggal: "18 April, 11:15",
                    namaPelanggan: "Budi Santoso",
                    lokasiAwal: "Teluk",
                    lokasiTujuan: "Telkom University Purwokerto",
                    harga: "Rp 9.000",
                  ),
                  const SizedBox(height: 16),

                  // KARTU 3 (Data Rizqi - Batal) - Berbeda lagi!
                  _buildKartuOrder(
                    isSukses: false,
                    tanggal: "03 April, 09:30",
                    namaPelanggan: "Agus Prayogo",
                    lokasiAwal: "Karang Lwas",
                    lokasiTujuan: "Teluk",
                    harga: "Rp 22.000",
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // 1. BAGIAN HEADER
  // =========================================================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aktivitas",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF981B1E),
            ),
          ),
          const SizedBox(height: 4),
          const Divider(color: Colors.grey, thickness: 1),
        ],
      ),
    );
  }

  // =========================================================
  // 2. BAGIAN TOMBOL TOGGLE
  // =========================================================
  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F4FF),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD32F2F),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Riwayat",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Berlangsung",
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // 3. BAGIAN KARTU ORDER (Sekarang menerima banyak Parameter!)
  // =========================================================
  Widget _buildKartuOrder({
    required bool isSukses,
    required String tanggal,
    required String namaPelanggan,
    required String lokasiAwal,
    required String lokasiTujuan,
    required String harga,
  }) {
    Color warnaStatus = isSukses ? Colors.green : Colors.red;
    String teksStatus = isSukses ? "Orderan Selesai" : "Orderan dibatalkan";
    // IconData ikonStatus = isSukses ? Feather.check_circle : Feather.x_circle;
    // IconData ikonUtama = isSukses ? FontAwesome.truck : Feather.x_circle;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFFF5B7B1), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Variabel tanggal dimasukkan ke sini
              Text(
                tanggal,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.all(6.0),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFFADBD8),
              //     borderRadius: BorderRadius.circular(8.0)
              //   ),
              //   child: Icon(
              //     ikonUtama,
              //     color: const Color(0xFFB03A2E),
              //     size: 16.0),
              // ),
            ],
          ),
          const SizedBox(height: 8),

          // Variabel namaPelanggan dimasukkan ke sini
          SizedBox(
            width: 100,
            child: Text(
              namaPelanggan,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Colors.grey),
                    Container(
                      height: 12,
                      width: 1.5,
                      color: Colors.grey.shade300,
                    ),
                    const Icon(Icons.circle, size: 8, color: Colors.red),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      // Variabel lokasiAwal dimasukkan ke sini
                      Expanded(
                        child: Text(
                          lokasiAwal,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //   child: Icon(
                      //     Feather.arrow_right,
                      //     size: 16,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      // Variabel lokasiTujuan dimasukkan ke sini
                      Expanded(
                        child: Text(
                          lokasiTujuan,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.poppins(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Variabel harga dimasukkan ke sini
              Text(
                harga,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // Icon(ikonStatus, color: warnaStatus, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    teksStatus,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: warnaStatus,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
