import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/controllers/loading_controller.dart';
import 'package:setting_api/models/akun.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AkunController extends GetxController {
  LoadingController loadingController = Get.put(LoadingController());
  Rxn<Akun> profileAkun = Rxn<Akun>();

  Future<void> getProfile() async {
    try {
      final user = db.auth.currentUser;

      if (user != null) {
        final profile = await db
            .from("akun")
            .select(
              'id_akun, username, nama_lengkap, alamat, role, foto_profile',
            )
            .eq("id_user", user.id)
            .maybeSingle();

        profileAkun.value = Akun.fromJson(profile!);

        print("[getProfile] : $profile");
        Get.defaultDialog(
          content: Text(profile.toString()),
          title: "getProfile",
        );
      }
    } catch (e) {
      print("[getProfile] #Error : $e");
    }
    loadingController.hide();
  }

  Future<void> updateProfile(Akun updateData) async {
    Map<String, dynamic> jsonData = updateData.toMap();
    final user = db.auth.currentUser;

    if (jsonData.isNotEmpty) {
      try {
        await db
            .from("akun")
            .update(jsonData)
            .eq("id_user", user!.id)
            .then((v) => getProfile());
        print("[updateProfile] : Data dengan id ${user.id}berhasil di update");
      } catch (e) {
        print("[updateProfile] #Error : $e");
      }
    }
  }

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
