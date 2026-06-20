import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/pengguna.dart';

class PenggunaController extends GetxController {
  Rxn<Pengguna> profilePengguna = Rxn<Pengguna>();

  final AkunController _akunController = Get.put(AkunController());

  Future<void> getProfilePengguna() async {
    try {
      final response = await db
          .from("pengguna")
          .select()
          .eq("id_akun", _akunController.profileAkun.value!.idAkun.toString())
          .maybeSingle();

      profilePengguna.value = Pengguna.fromJson(response!);
      print("[getProfilePengguna] : ${profilePengguna.value}");
    } catch (e) {
      print("[getProfilePengguna] #Error : $e");
    }
  }
}
