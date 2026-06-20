import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mykurir/controllers/auth_controller.dart';
import 'package:mykurir/controllers/loading_controller.dart';

class BerandaSementara extends StatelessWidget {
  const BerandaSementara({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> pages = [
      {"title": "Masukan Nomor HP", "path": "/masukan_no_hp"},
      {"title": "Permintaan Pesanan", "path": "/permintaan_pesanan"},
      {"title": "Pilih Role", "path": "/pilih_role"},
      {"title": "Rating Aplikasi", "path": "/rating_aplikasi"},
      {"title": "Verifikasi Telepon", "path": "/verif_telepon"},
      {"title": "Verifikasi OTP", "path": "/verif_otp"},
    ];
    LoadingController loadingController = Get.put(LoadingController());
    AuthController authController = Get.put(AuthController());

    String email = "sucrosa@gi.mhy", password = "123456";

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Authentication",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => {
                          loadingController.show(),
                          authController.login(email, password),
                        },
                        child: Text("Login"), // Nama tombol diperbaiki
                      ),
                      Text(
                        "Cek User",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => {
                          loadingController.show(),
                          authController.getUser(),
                        },
                        child: Text("Cek User"), // Nama tombol diperbaiki
                      ),
                      Text(
                        "Cek Detail Akun",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => {
                          loadingController.show(),
                          print(
                            "Detail user = ${authController.detailUser.value!.idAkun}",
                          ),
                        },
                        child: Text(
                          "Cek Detail AKun",
                        ), // Nama tombol diperbaiki
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => {
                          loadingController.show(),
                          authController.logout(),
                        },
                        child: Text("Logout"), // Nama tombol diperbaiki
                      ),
                    ],
                  ),
                ),
              ),
              for (Map data in pages)
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          data["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Get.toNamed(data["path"]),
                          child: Text(data["title"]), // Nama tombol diperbaiki
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
