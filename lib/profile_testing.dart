import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/akun_controller.dart';
import 'package:setting_api/controllers/loading_controller.dart';

class ProfileTesting extends StatelessWidget {
  const ProfileTesting({super.key});

  @override
  Widget build(BuildContext context) {
    AkunController akunController = Get.put(AkunController());
    LoadingController loadingController = Get.find();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () => loadingController.getLoadingStatus().value
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          loadingController.show();
                          akunController.getProfile();
                        },
                        child: Text("getProfile"),
                      ),
                      akunController.profileAkun.isNotEmpty
                          ? Column(
                              children: [
                                Text(
                                  "id akun : ${akunController.profileAkun[0]["id_akun"]}",
                                ),
                                Text(
                                  "username : ${akunController.profileAkun[0]["username"]}",
                                ),
                                Image.network(
                                  akunController.profileAkun[0]["foto_profile"],
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
