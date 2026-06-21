import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykurir/controllers/auth_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isAgree = false.obs;
    final AuthController authController = Get.put(AuthController());

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Halaman
            Text(
              "Hapus Akun", // <- Tulis disini: judul halaman, contoh "Hapus Akun"
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB01212),
              ),
            ),
            const SizedBox(height: 20),

            // Kalimat Pembuka
            const Text(
              "Setelah anda menyetujui penghapusan akun :",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // List Konsekuensi (3 item bernomor)
            _buildListItem(
              number: "1.",
              title:
                  "Akun Terhapus", // <- Tulis disini: judul item 1, contoh "Akun terhapus"
              description:
                  "Akun anda akan terhapus secara permanen saat ini tanpa ada backup ", // <- Tulis disini: deskripsi item 1, contoh "Akun anda akan terhapus secara permanen saat ini tanpa ada backup"
            ),
            _buildListItem(
              number: "2.",
              title: "Profil", // <- Tulis disini: judul item 2, contoh "profil"
              description:
                  "Informasi personal anda akan terhapus", // <- Tulis disini: deskripsi item 2, contoh "Informasi personal anda akan terhapus"
            ),
            _buildListItem(
              number: "3.",
              title:
                  "Riwayat Transaksi", // <- Tulis disini: judul item 3, contoh "Riwayat transaksi"
              description:
                  "Rincian riwayat transaksi, alamat akan terhapus", // <- Tulis disini: deskripsi item 3, contoh "Rincian riwayat transaksi, alamat akan terhapus"
            ),

            const SizedBox(height: 5),
            const Divider(color: Colors.grey),
            const SizedBox(height: 15),

            // Disclaimer
            Text(
              "MyKurir tidak bertanggung jawab atas hilangnya informasi, data setelah akun resmi dihapus", // <- Tulis disini: kalimat disclaimer, contoh "MyKurrir tidak bertanggung jawab atas hilangnya informasi, data setelah akun resmi dihapus"
              style: GoogleFonts.inter(fontSize: 13, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Kotak Checkbox Persetujuan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => Checkbox(
                      value: isAgree.value,
                      onChanged: (value) {
                        isAgree.value = !isAgree.value;
                      },
                      activeColor: const Color(0xFFB01212),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Saya setuju dan bersedia menghapus akun ini secara permanen",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                      ), // <- Tulis disini: teks persetujuan, contoh "Saya setuju dan bersedia menghapus akun ini secara permanen."
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ), // <- Jarak pengganti area kosong sebelum tombol, sesuaikan jika perlu
            // Tombol Utama Hapus Akun
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAgree.value
                        ? Color(0xFFB01212)
                        : Color(0xffD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isAgree.value
                      ? () {
                          authController.hapusAkun();
                          Get.offAllNamed("/");
                        }
                      : null,
                  child: Text(
                    "Hapus Akun", // <- Tulis disini: teks tombol utama, contoh "Hapus Akun"
                    style: GoogleFonts.inter(
                      color: isAgree.value ? Colors.white : Color(0xff2E2E2E),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Tombol Kembali
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB01212)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "Kembali", // <- Tulis disini: teks tombol kedua, contoh "Kembali"
                  style: GoogleFonts.inter(
                    color: Color(0xFFB01212),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget bantu untuk satu item bernomor (judul tebal + deskripsi)
  Widget _buildListItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$number $title",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(right: 40), // <- tambahan baru
            child: Text(
              description,
              style: GoogleFonts.inter(fontSize: 10, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
