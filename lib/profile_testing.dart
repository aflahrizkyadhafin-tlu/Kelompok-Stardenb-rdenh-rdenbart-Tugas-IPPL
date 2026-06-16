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
                      akunController.profileAkun.value != null
                          ? Column(
                              children: [
                                Text(
                                  "id akun : ${akunController.profileAkun.value!.idAkun}",
                                ),
                                Text(
                                  "username : ${akunController.profileAkun.value!.username}",
                                ),
                                Image.network(
                                  akunController
                                      .profileAkun
                                      .value!
                                      .fotoProfile!,
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
