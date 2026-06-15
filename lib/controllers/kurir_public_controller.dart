import 'package:get/state_manager.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/models/kurir.dart';

class KurirPublicController extends GetxController {
  Future<void> getKurirTersedia() async {
    try {
      final response = await db
          .from("kurir")
          .select()
          .eq("status_kurir", StatusKurir.available.name);
      print("[getKurirTersedia] : $response");
    } catch (e) {
      print("[getKurirTersedia] #Error : $e");
    }
  }

  Future<void> getDetailKurir(String idKurir) async {
    try {
      final response = await db.from("kurir").select().eq("id_kurir", idKurir);
      print("[getDetailKurir] : $response");
    } catch (e) {
      print("[getDetailKurir] #Error : $e");
    }
  }
}
