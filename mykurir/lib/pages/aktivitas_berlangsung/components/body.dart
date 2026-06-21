import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
// import 'package:icons_flutter/icons_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final PengirimanController _pengirimanController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,

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
                icon: Icon(Icons.list_alt),
                label: 'Aktivitas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline_rounded),
                label: 'Bantuan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildToggleButtons(),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8.0,
                  ),
                  children: [
                    for (var data
                        in _pengirimanController.pengirimanBerlangsung)
                      _buildKartuOrder(
                        isSukses: true,
                        namaLengkap: RxString(
                          data["akun"]["nama_lengkap"] ?? "No Name",
                        ),
                        statusPengiriman: RxString(data["status_pengiriman"]),
                        fotoProfile: RxString(
                          data["akun"]["foto_profile"] ?? "no image",
                        ),
                        alamatPengirim: RxString(data["alamat_pengirim"]),
                        alamatPenerima: RxString(data["alamat_penerima"]),
                      ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // 1. HEADER
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
          const SizedBox(height: 8),
          const Divider(color: Colors.grey, thickness: 1),
        ],
      ),
    );
  }

  // =========================================================
  // 2. TOMBOL TOGGLE
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
              child: GestureDetector(
                onTap: () => Get.offAndToNamed("/aktivitas_riwayat"),
                child: Center(
                  child: Text(
                    "Riwayat",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD32F2F),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Berlangsung",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
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
  // 3. KARTU ORDER — ELEMEN BARU DITAMBAHKAN DI SINI
  // =========================================================
  Widget _buildKartuOrder({
    required bool isSukses,
    required RxString namaLengkap,
    required RxString fotoProfile,
    required RxString statusPengiriman,
    required RxString alamatPengirim,
    required RxString alamatPenerima,
  }) {
    Color warnaStatus = isSukses ? const Color(0xFF1A7A4A) : Colors.red;
    Color bgStatus = isSukses ? const Color(0xFFE8F5EE) : Colors.red.shade50;

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: const Color(0xFFF5B7B1), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ DITAMBAH: Baris foto profil + nama + rating + badge status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fotoProfile.value != "no image"
                  ? Image.network(fotoProfile.value)
                  : CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      // child: const Icon(Feather.user, color: Colors.white, size: 30),
                    ),
              const SizedBox(width: 12),

              // Nama dan rating
              Expanded(
                child: Transform.translate(
                  offset: Offset(3, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        namaLengkap.value,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          // const Icon(FontAwesome.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text("4.0", style: GoogleFonts.poppins(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Badge status (SEDANG DIANTAR)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: bgStatus,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(FontAwesome.circle, color: warnaStatus, size: 8),
                    const SizedBox(width: 4),
                    Text(
                      statusPengiriman.value,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: warnaStatus,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ✅ DITAMBAH: Rute PENGIRIM dan PENERIMA
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(25, 17),
                // Ikon titik rute (lingkaran merah → garis → pin hijau)
                child: Column(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFFA20513),
                          width: 3.2,
                        ),
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(-17, 5),
                      child: Container(
                        height: 24,
                        width: 2.5,
                        color: Color(0xFFE4BEBA),
                      ),
                    ),

                    // Transform.translate(
                    //   offset: Offset(0, 14),
                    // child: const Icon(
                    //   FontAwesome.map_marker,
                    //   color: Color(0xFF1A7A4A),
                    //   size: 20),
                    // ),
                  ],
                ),
              ),
              const SizedBox(width: 40),

              // Teks lokasi
              Expanded(
                child: Transform.translate(
                  offset: Offset(0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PENGIRIM",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5D5E61),
                        ),
                      ),
                      Text(
                        alamatPengirim.value,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "PENERIMA",
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5D5E61),
                        ),
                      ),
                      Text(
                        alamatPenerima.value,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // ✅ DITAMBAH: Tombol Detail & Chat Driver
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 50,
                // Tombol Detail (outline merah)
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF9E1014)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    "Detail",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF9E1014),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Tombol Chat Driver (hijau solid)
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    // icon: const Icon(Feather.message_circle, color: Colors.white, size: 16),
                    label: Text(
                      "Chat Driver",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A7A4A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
