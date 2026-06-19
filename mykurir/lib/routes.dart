import 'package:get/get.dart';
import 'package:mykurir/login_sementara.dart';
import 'package:mykurir/pages/masukNoHP/masukNoHP_screen.dart';
import 'package:mykurir/pages/permintaanPesanan/pesanan_screen.dart';
import 'package:mykurir/pages/setting/setting_screen.dart';

List<GetPage<dynamic>> routes = [
  //Login Sementara
  GetPage(name: "/", page: () => LoginSementara()),

  //Route Verifikasi OTP
  GetPage(name: "/masukan_no_hp", page: () => MasukNoHPScreen()),

  //Route Pesanan
  GetPage(name: "/permintaan_pesanan", page: () => PermintaanPesananScreen()),

  //Route Setting
  GetPage(name: "/setting", page: () => SettingScreen()),
];
