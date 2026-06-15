import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AkunController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());

  Future<void> getProfile() async {}

  Future<void> updateProfile() async {}

  final selectedImage = Rxn<File>();
  RxString imageURL = "".obs;

  Future<void> pickImageFromGalery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    // final XFile? pickedFile = await picker.pickImage(
    //   source: ImageSource.camera,
    //   imageQuality: 80,
    // );

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadFotoProfile() async {
    try {
      final user = db.auth.currentUser;
      final Uint8List imageBytes = await selectedImage.value!.readAsBytes();

      String filepath =
          "${user!.id}/${user.id}${p.extension(selectedImage.value!.path)}";

      final List<FileObject> files = await db.storage
          .from("foto_profile")
          .list(path: user.id);

      if (files.isNotEmpty) {
        final List<String> pathToRemove = files
            .map((file) => '${user.id}/${file.name}')
            .toList();
        await db.storage.from("foto_profile").remove(pathToRemove);
        print("Foto lama berhasil dihapus");
      }

      await db.storage
          .from("foto_profile")
          .uploadBinary(
            filepath,
            imageBytes,
            fileOptions: FileOptions(upsert: true, contentType: "image/*"),
          );

      final String publicUrl = Supabase.instance.client.storage
          .from('foto_profile')
          .getPublicUrl(filepath);

      if (publicUrl.isNotEmpty) {
        await db
            .from("akun")
            .update({"foto_profile": publicUrl})
            .eq("id_user", user.id);
        print("[uploadFotoProfile] : Foto berhasil di update");
      }

      imageURL.value = publicUrl;

      print("[uploadFotoProfile] : $publicUrl");
    } catch (e) {
      print("[uploadFotoProfile] #Error : $e");
    }
  }
}
