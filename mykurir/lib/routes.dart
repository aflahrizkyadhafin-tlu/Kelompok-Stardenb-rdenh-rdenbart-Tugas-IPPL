import 'package:get/get.dart';
import 'package:mykurir/login_sementara.dart';
import 'package:mykurir/pages/daftar/daftar_screen.dart';
import 'package:mykurir/pages/login/login_screen.dart';
import 'package:mykurir/pages/masukNoHP/masukNoHP_screen.dart';
import 'package:mykurir/pages/permintaanPesanan/pesanan_screen.dart';
import 'package:mykurir/pages/pilihrole/pilihrole_screen.dart';
import 'package:mykurir/pages/rating_aplikasi/rating_aplikasi_screen.dart';
import 'package:mykurir/pages/setting/setting_screen.dart';
import 'package:mykurir/pages/verifotp/verifotp_screen.dart';

List<GetPage<dynamic>> routes = [
  // Login Sementara
  GetPage(name: "/login_sementara", page: () => LoginSementara()),

  // Route Login
  GetPage(name: "/", page: () => LoginScreen()),

  // Route Daftar
  GetPage(name: "/daftar", page: () => DaftarScreen()),

  // Route Verifikasi OTP
  GetPage(name: "/masukan_no_hp", page: () => MasukNoHPScreen()),
  GetPage(name: "/verif_otp", page: () => VerifOtpScreen()),

  // Route Pesanan
  GetPage(name: "/permintaan_pesanan", page: () => PermintaanPesananScreen()),

  // Route Setting
  GetPage(name: "/setting", page: () => SettingScreen()),

  // Route Pilih Role
  GetPage(name: "/pilih_role", page: () => PilihroleScreen()),

  // Route Rating Aplikasi
  GetPage(name: "/rating_aplikasi", page: () => RatingAplikasiScreen()),
];
