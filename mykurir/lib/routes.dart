import 'package:get/get.dart';
import 'package:mykurir/beranda_sementara.dart';
import 'package:mykurir/components/loading/loading.dart';
import 'package:mykurir/pages/daftar/daftar_screen.dart';
import 'package:mykurir/pages/login/login_screen.dart';
import 'package:mykurir/pages/masukNoHP/masukNoHP_screen.dart';
import 'package:mykurir/pages/permintaanPesanan/pesanan_screen.dart';
import 'package:mykurir/pages/pilihrole/pilihrole_screen.dart';
import 'package:mykurir/pages/profil/profil_screen.dart';
import 'package:mykurir/pages/rating_aplikasi/rating_aplikasi_screen.dart';
import 'package:mykurir/pages/rating_driver/rating_driver_screen.dart';
import 'package:mykurir/pages/setting/setting_screen.dart';
import 'package:mykurir/pages/verifotp/verifotp_screen.dart';
import 'package:mykurir/pages/terima_kasih_penilaian/terima_kasih_penilaian_screen.dart';

List<GetPage<dynamic>> routes = [
  // Login Sementara
  GetPage(name: "/beranda_sementara", page: () => BerandaSementara()),

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

  // Route Rating
  GetPage(name: "/rating_driver", page: () => RatingDriverScreen()),
  GetPage(name: "/rating_aplikasi", page: () => RatingAplikasiScreen()),
  GetPage(
    name: "/terima_kasih_penilaian",
    page: () => TerimakasihPenilaianScreen(),
  ),

  // Route Profil
  GetPage(name: "/profil", page: () => ProfilScreen()),
];
