import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/auth_controller.dart';
import 'package:setting_api/controllers/loading_controller.dart';

class AuthTesting extends StatelessWidget {
  const AuthTesting({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());
    // Data dummy
    // Pengiriman dataDummy = Pengiriman(
    //   nomorResi: 'JNT123456789',
    //   deskripsiBarang: 'Laptop ASUS Vivobook 14 Inch',
    //   berat: 2.5,
    //   biaya: 45000,
    //   statusPengiriman: StatusPengiriman.pending,
    //   namaPenerima: "Budi Santoso",
    //   nomorTeleponPenerima: "081234567890",
    //   alamatPenerima: "Jl. Jenderal Sudirman No. 45, Purwokerto",
    //   latPenerima: -7.4140,
    //   longPenerima: 109.2370,
    //   alamatPengirim: "Gudang Pusat, Jakarta Selatan",
    //   latPengirim: -6.2297,
    //   longPengirim: 106.8295,
    //   idPelanggan: '3b5080c8-619d-4f6b-82c2-e6ec902d4af4',
    // );

    String email = "sucrosa@gi.mhy";
    String nomorTelepon = "621234567890";
    String password = "123456";
    String newPassword = "098123";
    TextEditingController kodeOTP = TextEditingController();
    LoadingController loading = Get.put(LoadingController());

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => loading.getLoadingStatus().value
              ? Center(child: CircularProgressIndicator(color: Colors.red))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ================================
                      // REGISTRASI
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Registrasi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => {
                                  loading.show(),
                                  controller.register(email, password),
                                },
                                child: const Text("Cek Register"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // Login
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => {
                                  loading.show(),
                                  controller.login(email, password),
                                },
                                child: const Text("Login"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // OTP EMAIL
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "OTP Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                decoration: const InputDecoration(
                                  hintText: "Kode OTP",
                                  border: OutlineInputBorder(),
                                ),
                                controller: kodeOTP,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => controller.verifOTPEmail(
                                  kodeOTP.text.trim(),
                                  email,
                                ),
                                child: const Text("Verifikasi Token"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // GANTI NOMOR TELEPON & OTP
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Ganti Nomor Telepon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    controller.gantiNomorTelepon(nomorTelepon),
                                child: const Text("Ganti Nomor"),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                decoration: const InputDecoration(
                                  hintText: "Kode OTP Nomor",
                                  border: OutlineInputBorder(),
                                ),
                                controller: kodeOTP,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => controller.verifOTPTelepon(
                                  nomorTelepon,
                                  kodeOTP.text.trim(),
                                ),
                                child: const Text("Verifikasi Token"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // MANAJEMEN USER
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Manajemen User",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => controller.cekUser(),
                                child: const Text("Cek User"),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => {
                                  loading.show(),
                                  controller.logout(),
                                },
                                child: const Text("Logout"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // PASSWORD (LUPA / GANTI)
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Lupa / Ganti Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () =>
                                    controller.sendOTPPassword(email),
                                child: const Text(
                                  "Send OTP Password",
                                ), // Nama tombol diperbaiki
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => controller.changePassword(
                                  kodeOTP.text.trim(),
                                  newPassword,
                                  email,
                                ),
                                child: const Text("Change Password"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Ganti Page",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () => Get.toNamed("/testingphoto"),
                                child: const Text(
                                  "Testing Photo",
                                ), // Nama tombol diperbaiki
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
