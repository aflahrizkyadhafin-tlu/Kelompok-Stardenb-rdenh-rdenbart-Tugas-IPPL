import 'package:get/state_manager.dart';
import 'package:mykurir/db/connection.dart';
import 'package:mykurir/models/kurir.dart';

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
}
