import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setting_api/controllers/akun_controller.dart';
import 'package:setting_api/controllers/auth_controller.dart';

class PhotoTesting extends StatelessWidget {
  const PhotoTesting({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    AkunController akunController = Get.put(AkunController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => akunController.selectedImage.value != null
                  ? Image.file(
                      akunController.selectedImage.value!,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    )
                  : const Text("Belum ada gambar yang dipilih"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: akunController.pickImageFromGalery,
              child: const Text("Pilih gambar"),
            ),
            ElevatedButton(
              onPressed: () {
                akunController.uploadFotoProfile();
              },
              child: Text("Upload image"),
            ),
            ElevatedButton(
              onPressed: () {
                authController.cekUser();
              },
              child: Text("Cek user"),
            ),
            Obx(() => Image.network(akunController.imageURL.value)),
          ],
        ),
      ),
    );
  }
}
