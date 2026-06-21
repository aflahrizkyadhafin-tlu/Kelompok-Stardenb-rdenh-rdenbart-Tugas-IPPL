import 'package:get/get.dart';
import 'package:mykurir/controllers/akun_controller.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/kurir.dart';

class KurirController extends GetxController {
  RxList<Map> kurirTersedia = <Map>[].obs;
  RxList<Map> riwayatKurir = <Map>[].obs;
  RxBool isLoading = false.obs;

  final AkunController _akunController = Get.put(AkunController());

  Future<void> getKurirTersedia() async {
    try {
      final response = await db
          .from("kurir")
          .select('''
            id_kurir,
            rating,
            kendaraan,
            plat_nomor,
            status_kurir,
            lokasi_long,
            lokasi_lat,
            created_at,
            id_akun,
            akun!id_akun(username, nama_lengkap, foto_profile)
            ''')
          .eq("status_kurir", StatusKurir.available.name);

      if (response.isNotEmpty) {
        kurirTersedia.value = response;
      }
      print("[getKurirTersedia] : $response");
    } catch (e) {
      print("[getKurirTersedia] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<dynamic> getDetailKurir(String idKurir) async {
    try {
      final response = await db
          .from("kurir")
          .select()
          .eq("id_kurir", idKurir)
          .maybeSingle();

      print("[getDetailKurir] : $response");
      return Kurir.fromJson(response!);
    } catch (e) {
      print("[getDetailKurir] #Error : $e");
      return null;
    }
  }

  Future<void> ambilKurirUser() async {
    try {
      final response = await db
          .from("pengiriman")
          .select(
            "id_pengiriman, id_kurir, created_at, kurir!id_kurir(id_akun, akun!id_akun(nama_lengkap))",
          )
          .eq("id_akun", _akunController.profileAkun.value!.idAkun.toString());

      if (response.isNotEmpty) {
        riwayatKurir.value = response;
      }
    } catch (e) {
      print("[ambilKurirUser] #Error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
