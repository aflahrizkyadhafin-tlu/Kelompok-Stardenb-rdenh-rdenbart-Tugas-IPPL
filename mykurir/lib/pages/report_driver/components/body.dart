import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/kurir_controller.dart';
import 'package:mykurir/controllers/laporan_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    KurirController _kurirController = Get.put(KurirController());
    AkunController _akunController = Get.put(AkunController());
    LaporanController _laporanController = Get.put(LaporanController());

    return Obx(
      () => _kurirController.isLoading.value
          ? LoadingScreen()
          : Padding(
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
                      itemCount: _kurirController.riwayatKurir.length,
                      // Divider dibuat tanpa margin/translate agar tidak memakan tempat
                      separatorBuilder: (context, index) => const Divider(
                        color: Colors.black87,
                        thickness: 1.0,
                        height: 1.0, // Kunci jarak antar item tetap rapat
                      ),
                      itemBuilder: (context, index) {
                        final kurir = _kurirController.riwayatKurir[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListTile(
                            // Kombinasi properti ini yang membuat teks sangat mepet
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity: const VisualDensity(vertical: -4),
                            minVerticalPadding: 0,

                            title: Text(
                              kurir['kurir']['akun']['nama_lengkap']!,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF232323),
                              ),
                            ),
                            subtitle: Text(
                              'Kurir - ${DateFormat('dd/MM/yyyy').format(DateTime.parse(kurir["created_at"].toString())).toString()}',
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
                              _laporanController.dataKirimLaporan.reporterId =
                                  _akunController.profileAkun.value!.idAkun;
                              _laporanController.dataKirimLaporan.reportedId =
                                  kurir['kurir']['id_akun'];
                              Get.toNamed("/report_driver_alasan");
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
