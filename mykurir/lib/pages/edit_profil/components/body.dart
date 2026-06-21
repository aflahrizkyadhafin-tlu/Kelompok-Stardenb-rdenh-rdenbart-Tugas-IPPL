import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/models/akun.dart';
import 'package:mykurir/pages/edit_profil/components/edit_profil_form.dart';
// import 'package:icons_flutter/icons_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    AkunController akunController = Get.put(AkunController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Edit Profil',
            style: TextStyle(
              color: Color(0xFF9E1014),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[400], height: 1.0),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => akunController.isLoading.value || authController.isLoading.value
              ? LoadingScreen()
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            akunController.selectedImage.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(
                                      Radius.circular(
                                        MediaQuery.sizeOf(context).height,
                                      ),
                                    ),
                                    child: Image.file(
                                      akunController.selectedImage.value!,
                                      width: 110,
                                      height: 110,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : akunController
                                          .profileAkun
                                          .value!
                                          .fotoProfile !=
                                      null
                                ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.all(
                                      Radius.circular(
                                        MediaQuery.sizeOf(context).height,
                                      ),
                                    ),
                                    child: Image.network(
                                      akunController
                                          .profileAkun
                                          .value!
                                          .fotoProfile
                                          .toString(),
                                      width: 110,
                                      height: 110,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFFCCCCCC),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.1,
                                          ),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.person,
                                        size: 75,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 8),

                            // tombol Ubah Profil
                            TextButton(
                              onPressed: () {
                                akunController.pickImageFromGalery();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Ubah Profil',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        'Informasi Pribadi',
                        style: TextStyle(
                          color: Color(0xFF9E1014),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Column(
                          children: [
                            _buildEditItem(
                              icon: Icons.account_circle_outlined,
                              label: 'Username',
                              value:
                                  akunController.profileAkun.value!.username !=
                                      null
                                  ? akunController.profileAkun.value!.username
                                        .toString()
                                  : "-",
                              onTap: () {
                                Get.to(
                                  () => EditProfilForm(),
                                  arguments: {
                                    "type": "Username",
                                    "value":
                                        akunController
                                                .profileAkun
                                                .value!
                                                .username !=
                                            null
                                        ? akunController
                                              .profileAkun
                                              .value!
                                              .username
                                              .toString()
                                        : "-",
                                  },
                                );
                              },
                            ),
                            Divider(height: 1, color: Colors.grey[300]),
                            _buildEditItem(
                              icon: Icons.person_outline,
                              label: 'Nama Pengguna',
                              value:
                                  akunController
                                          .profileAkun
                                          .value!
                                          .namaLengkap !=
                                      null
                                  ? akunController
                                        .profileAkun
                                        .value!
                                        .namaLengkap
                                        .toString()
                                  : "-",
                              onTap: () {
                                Get.to(
                                  () => EditProfilForm(),
                                  arguments: {
                                    "type": "Nama Pengguna",
                                    "value":
                                        akunController
                                                .profileAkun
                                                .value!
                                                .namaLengkap !=
                                            null
                                        ? akunController
                                              .profileAkun
                                              .value!
                                              .namaLengkap
                                              .toString()
                                        : "-",
                                  },
                                );
                              },
                            ),
                            Divider(height: 1, color: Colors.grey[300]),
                            _buildEditItem(
                              icon: Icons.map,
                              label: 'Alamat',
                              value:
                                  akunController.profileAkun.value!.alamat !=
                                      null
                                  ? akunController.profileAkun.value!.alamat
                                        .toString()
                                  : "-",
                              onTap: () {
                                Get.to(
                                  () => EditProfilForm(),
                                  arguments: {
                                    "type": "Alamat",
                                    "value":
                                        akunController
                                                .profileAkun
                                                .value!
                                                .alamat !=
                                            null
                                        ? akunController
                                              .profileAkun
                                              .value!
                                              .alamat
                                              .toString()
                                        : "-",
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Kontak',
                        style: TextStyle(
                          color: Color(0xFF9E1014),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: _buildEditItem(
                          icon: Icons.phone_outlined,
                          label: 'No Telepon',
                          value: authController.detailUser.value!.phone != null
                              ? authController.detailUser.value!.phone
                                    .toString()
                              : "-",
                          onTap: () {},
                        ),
                      ),

                      const SizedBox(height: 40),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            akunController.isLoading.value = true;
                            if (akunController.selectedImage.value != null) {
                              akunController.uploadFotoProfile();
                            }
                            Akun updateData = Akun(
                              username:
                                  akunController.profileAkun.value!.username,
                              namaLengkap:
                                  akunController.profileAkun.value!.namaLengkap,
                              alamat: akunController.profileAkun.value!.alamat,
                            );
                            akunController.updateProfile(updateData);
                            authController.refreshData();

                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE31E24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Simpan Perubahan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            akunController.isLoading.value = true;
                            akunController.selectedImage.value = null;
                            akunController.getProfile();
                            Get.back();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFE31E24),
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Batalkan',
                            style: TextStyle(
                              color: Color(0xFFE31E24),
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
        ),
      ),
    );
  }

  Widget _buildEditItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 18, color: Colors.black54),
                    const SizedBox(width: 10),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          IconButton(
            onPressed: onTap,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: label != "No Telepon"
                ? Icon(Icons.edit_square, size: 20, color: Colors.black54)
                : Container(),
          ),
        ],
      ),
    );
  }
}
