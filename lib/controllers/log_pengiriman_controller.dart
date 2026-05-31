import 'package:get/get.dart';
import 'package:setting_api/controllers/connection.dart';
import 'package:setting_api/models/log_pengiriman.dart';

class LogPengirimanController extends GetxController{
  Future<void> getLogByPengiriman(String idPengiriman) async{
    try {
      final response = await db.from("log_pengiriman").select().eq("id_pengiriman", idPengiriman);
      print("[getLogByPengiriman] : $response");
    } catch (e) {
      print("[getLogByPengiriman] #Error : $e");
    }
  }

  Future<void> tambahLog(LogPengiriman logPengiriman) async{
    Map<String, dynamic> jsonData = logPengiriman.toJson();

    try {
      await db.from("log_pengiriman").insert(jsonData);
      print("[tambahLog] : Data berhasil ditambahkan");
    } catch (e) {
      print("[tambahLog] #Error : $e");
    }
  }
}