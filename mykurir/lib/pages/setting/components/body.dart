import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/kurir_controller.dart';
import 'package:mykurir/controllers/laporan_controller.dart';
import 'package:mykurir/controllers/pengiriman_controller.dart';
import 'statususerpage.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isDriverRole = false.obs;

    AuthController authController = Get.put(AuthController());
    AkunController akunController = Get.put(AkunController());
    KurirController kurirController = Get.put(KurirController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => authController.isLoading.value || akunController.isLoading.value
            ? LoadingScreen()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                //Gradient
                                Color(0xFFB71C1C),
                                Color(0xFFEF5350),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 60, left: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 0.0),
                                child: Text(
                                  'Pengaturan Akun',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Profile Card
                        Positioned(
                          top: 140,
                          left: 20,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                akunController.profileAkun.value?.fotoProfile !=
                                        null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffFFCD0F),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              MediaQuery.sizeOf(context).height,
                                            ),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadiusGeometry.all(
                                                Radius.circular(
                                                  MediaQuery.sizeOf(
                                                    context,
                                                  ).height,
                                                ),
                                              ),
                                          child: Image.network(
                                            akunController
                                                .profileAkun
                                                .value!
                                                .fotoProfile
                                                .toString(),
                                            fit: BoxFit.fill,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.blue.shade50,
                                        child: const Icon(
                                          Icons.person_outline,
                                          size: 36,
                                          color: Colors.blue,
                                        ),
                                      ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      akunController
                                              .profileAkun
                                              .value
                                              ?.namaLengkap
                                              ?.toString() ??
                                          "-",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF212121),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      authController.detailUser.value?.email
                                              .toString() ??
                                          "-",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      authController.detailUser.value?.phone
                                              .toString() ??
                                          "-",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 80),
                    // Menu List
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('Preferensi'),
                          _buildMenuItem(
                            Icons.person_outline,
                            'Profilku',
                            onTap: () {
                              Get.toNamed("/profil");
                            },
                          ),
                          _buildMenuItem(
                            Icons.shield_outlined,
                            'Keamanan Akun',
                            onTap: () {
                              Get.toNamed("/keamanan_akun");
                            },
                          ),
                          _buildMenuItem(
                            Icons.location_on_outlined,
                            'Alamat Tersimpan',
                            onTap: () {},
                          ),
                          _buildMenuSwitchItem(
                            Icons.person_pin_outlined,
                            isDriverRole.value
                                ? 'Role : Kurir'
                                : 'Role : Pengguna',
                            isDriverRole.value,
                            (value) {
                              isDriverRole.value = value;

                              String statusTeks = value ? 'Kurir' : 'Pengguna';

                              // Animasi & Nav
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => StatusUserPage(
                                        statusRole: statusTeks,
                                      ),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                  transitionDuration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  reverseTransitionDuration: const Duration(
                                    milliseconds: 400,
                                  ),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 20),
                          _buildSectionTitle('Aktivitas'),
                          _buildMenuItem(
                            Icons.assignment_outlined,
                            'Aktivitas Order',
                            onTap: () {
                              PengirimanController pengirimanController =
                                  Get.put(PengirimanController());
                              pengirimanController.isLoading.value = true;
                              Get.toNamed("/aktivitas_berlangsung");
                            },
                          ),
                          _buildMenuItem(
                            Icons.star_border,
                            'Beri Rating',
                            onTap: () {
                              Get.toNamed("/rating_aplikasi");
                            },
                          ),
                          _buildMenuItem(
                            Icons.outlined_flag,
                            'Report Driver',
                            onTap: () {
                              kurirController.isLoading.value = true;
                              kurirController.ambilKurirUser();
                              Get.toNamed("/report_driver");
                            },
                          ),

                          const SizedBox(height: 20),
                          _buildSectionTitle('Lainnya'),
                          _buildMenuItem(
                            Icons.help_outline,
                            'Pusat Bantuan',
                            onTap: () {
                              Get.toNamed("/pusat_bantuan");
                            },
                          ),
                          _buildMenuItem(
                            Icons.badge_outlined,
                            'Daftar menjadi kurir',
                            onTap: () {
                              Get.toNamed("/daftar_mitra_driver_1");
                            },
                          ),
                          _buildMenuItem(
                            Icons.delete_outline,
                            'Atur Akun',
                            onTap: () {
                              Get.toNamed("/opsi_hapus_akun");
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: const Color(0xFF424242)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xFF424242)),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildMenuSwitchItem(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onSelectionChanged,
  ) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: const Color(0xFF424242)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Color(0xFF424242)),
        ),
        trailing: SizedBox(
          width: 50,
          child: Switch(
            value: value,
            onChanged: onSelectionChanged,
            activeThumbColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
