import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/laporan_controller.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:setting_api/models/laporan.dart';

class LaporanTesting extends StatelessWidget {
  LaporanTesting({super.key});

  // Inisialisasi LaporanController
  final LaporanController controller = Get.put(LaporanController());
  LoadingController loadingController = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testing Laporan Controller')),
      body: Obx(
        () => loadingController.getLoadingStatus().value
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- BAGIAN TOMBOL TESTING ---
                    const Text(
                      'Aksi Testing',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Membuat data dummy untuk testing
                            final dummyLaporan = Laporan(
                              createdAt: DateTime.now(),
                              pesan:
                                  "Pesan test laporan ${DateTime.now().second}",
                              reporterId:
                                  "36c624e9-1b46-470f-b64a-9aa57bb6fb63",
                              reportedId:
                                  "0f1b77b0-c30e-421e-b40e-695fd8946003",
                            );
                            loadingController.show();
                            controller.buatLaporan(dummyLaporan);
                          },
                          child: const Text('Buat Laporan (Dummy)'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            loadingController.show();
                            controller.laporanSaya
                                .clear(); // Clear sebelum fetch
                            controller.getLaporanSaya(
                              "36c624e9-1b46-470f-b64a-9aa57bb6fb63",
                            );
                          },
                          child: const Text('Get Laporan Saya'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            loadingController.show();
                            controller.listLaporan
                                .clear(); // Clear sebelum fetch
                            controller.getAllLaporan();
                          },
                          child: const Text('Get All Laporan'),
                        ),
                      ],
                    ),
                    const Divider(height: 30),

                    // --- BAGIAN HASIL LIST LAPORAN ---
                    const Text(
                      'Semua Laporan (listLaporan):',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Obx(() {
                      if (controller.listLaporan.isEmpty) {
                        return const Text(
                          'Data laporan kosong. Tekan "Get All Laporan".',
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.listLaporan.length,
                        itemBuilder: (context, index) {
                          final laporan = controller.listLaporan[index];
                          return Card(
                            child: ListTile(
                              title: Text(laporan.pesan ?? 'Tanpa pesan'),
                              subtitle: Text(
                                'ID: ${laporan.idLaporan} | Reported: ${laporan.reportedId}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.info,
                                      color: Colors.blue,
                                    ),
                                    // Mengubah ID int ke String karena fungsi getDetailLaporan menerima parameter String
                                    onPressed: () =>
                                        controller.getDetailLaporan(
                                          laporan.idLaporan.toString(),
                                        ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    // Mengubah ID int ke String karena fungsi hapusLaporan menerima parameter String
                                    onPressed: () => controller.hapusLaporan(
                                      laporan.idLaporan.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    const Divider(height: 30),

                    // --- BAGIAN HASIL DETAIL LAPORAN ---
                    const Text(
                      'Detail Laporan Terpilih:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      final detail = controller.detailLaporan.value;
                      if (detail == null) {
                        return const Text('Belum ada laporan yang dipilih.');
                      }
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${detail.idLaporan}'),
                            Text('Dibuat: ${detail.createdAt.toString()}'),
                            Text('Pesan: ${detail.pesan ?? "-"}'),
                            Text('Reporter ID: ${detail.reporterId}'),
                            Text('Reported ID: ${detail.reportedId}'),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
      ),
    );
  }
}
