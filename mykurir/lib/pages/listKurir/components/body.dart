import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/kurir_controller.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
import 'package:mykurir/controllers/whatsapp_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  void _showDriverPopup(BuildContext context, Map kurir) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFF7EFE5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Color(0xFF9E1014), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3B7B8),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF9E1014),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 45,
                        color: Color(0xFF9E1014),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kurir['akun']['nama_lengkap'] ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                (kurir['rating'] ?? '-').toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: List.generate(
                    30,
                    (index) => Expanded(
                      child: Container(
                        color: index % 2 == 0
                            ? const Color(0xFF9E1014)
                            : Colors.transparent,
                        height: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Informasi Kendaraan',
                  style: TextStyle(
                    color: Color(0xFF9E1014),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3B7B8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF9E1014),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.motorcycle,
                        size: 30,
                        color: Color(0xFF9E1014),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kurir['kendaraan'] ?? "-",
                          style: const TextStyle(
                            color: Color(0xFF9E1014),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5A0C0E),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            kurir['plat_nomor'] ?? '-',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFE31E24),
                        width: 1.5,
                      ),
                      backgroundColor: const Color(0xFFF7EFE5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      shadowColor: Colors.black,
                    ),
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(
                        color: Color(0xFFE31E24),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final KurirController _kurirController = Get.put(KurirController());
    final PengirimanController _pengirimanController = Get.put(
      PengirimanController(),
    );
    bool haveOrder = _pengirimanController.sendData.latPenerima != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFE31E24),
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'List Kurir Tersedia',
          style: TextStyle(
            color: Color(0xFFE31E24),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => _kurirController.isLoading.value
              ? LoadingScreen()
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  itemCount: _kurirController.kurirTersedia.length,
                  itemBuilder: (context, index) {
                    final kurir = _kurirController.kurirTersedia[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: false,
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          trailing: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30,
                          ),
                          leading: const CircleAvatar(
                            radius: 16,
                            backgroundColor: Color(0xFF5B9BD5),
                            child: Text(
                              'P',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            kurir['akun']['nama_lengkap'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          children: [
                            Container(color: Colors.black26, height: 1),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  _buildDetailRow(
                                    'Rating',
                                    ': ${kurir['rating'] ?? "-"}',
                                  ),
                                  const SizedBox(height: 8),
                                  _buildDetailRow(
                                    'Kendaraan',
                                    ': ${kurir['kendaraan']}',
                                  ),
                                  const SizedBox(height: 8),
                                  _buildDetailRow(
                                    'Status',
                                    ': ${kurir['status_kurir'] ?? "-"}',
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: haveOrder
                                          ? () {
                                              _showDriverPopup(context, kurir);
                                            }
                                          : () {
                                              WhatsappController.bukaWhatsapp(
                                                kurir['akun']['user']["phone"],
                                              );
                                            },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: haveOrder
                                            ? Color(0xffE31E24)
                                            : Color(0xFF4ACA2D),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          !haveOrder
                                              ? Icon(
                                                  Icons.chat,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              : Container(),
                                          SizedBox(width: 8),
                                          Text(
                                            haveOrder
                                                ? "Buat Permintaan"
                                                : 'Hubungi Kurir',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          haveOrder
                                              ? Icon(
                                                  Icons.arrow_right_alt_sharp,
                                                  color: Colors.white,
                                                  size: 20,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
