import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/akun_controller.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:setting_api/models/akun.dart';

class ProfileTesting extends StatelessWidget {
  const ProfileTesting({super.key});

  @override
  Widget build(BuildContext context) {
    AkunController akunController = Get.put(AkunController());
    LoadingController loadingController = Get.find();

    Akun updateData = Akun(alamat: "Pangandaran");

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () => loadingController.getLoadingStatus().value
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      // ================================
                      // Get Profile
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Get Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  loadingController.show();
                                  akunController.getProfile();
                                },
                                child: Text("getProfile"),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ================================
                      // Update Profile
                      // ================================
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "Update Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  loadingController.show();
                                  akunController.updateProfile(updateData);
                                },
                                child: Text("Update Profile"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      akunController.profileAkun.value != null
                          ? Column(
                              children: [
                                Text(
                                  "id akun : ${akunController.profileAkun.value!.idAkun}",
                                ),
                                Text(
                                  "username : ${akunController.profileAkun.value!.username}",
                                ),
                                Text(
                                  "alamat : ${akunController.profileAkun.value!.alamat}",
                                ),
                                Image.network(
                                  akunController
                                      .profileAkun
                                      .value!
                                      .fotoProfile!,
                                  width: 200,
                                ),
                              ],
                            )
                          : Text("Profile belum ada"),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
