import 'package:get/get.dart';

class PengirimanController extends GetxController {
  num hitungBiaya(int bobot, jarak, biaya) {
    return bobot * jarak * biaya;
  }

  Future<void> tunjukKurir() async {}
  Future<void> perbaruiStatus() async {}
  Future<void> buatResi() async {}
}
