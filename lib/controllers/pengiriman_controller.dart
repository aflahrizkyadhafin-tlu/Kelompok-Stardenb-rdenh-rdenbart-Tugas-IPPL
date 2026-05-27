import 'package:get/get.dart';
import 'package:setting_api/models/pengiriman.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class PengirimanController extends GetxController {
  num hitungBiaya(int bobot, jarak, biaya) {
    return bobot * jarak * biaya;
  }

  Future<void> tunjukKurir() async {}
  Future<void> perbaruiStatus() async {}
  Future<void> buatResi() async {}
  
  static Future<Pengiriman?> getPengirimanById(String idPengiriman) async{
    try {
      final response = await supabase.from('pengiriman').select().eq("id_pengiriman", idPengiriman);
      if (response.isNotEmpty) {
        return Pengiriman.fromJson(response[0]);
      }
      
    } catch (e) {
      print(e);
    }
    return null;
  }
}
