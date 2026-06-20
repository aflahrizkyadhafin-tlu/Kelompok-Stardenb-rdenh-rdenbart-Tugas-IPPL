import 'package:get/get.dart';
import 'package:mykurir/beranda_sementara.dart';
import 'package:mykurir/pages/aktivitas_berlangsung/aktivitas_berlangsung_screen.dart';
import 'package:mykurir/pages/aktivitas_riwayat/aktivitas_riwayat_screen.dart';
import 'package:mykurir/pages/daftar/daftar_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_1/mitra_driver_1_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_2/mitra_driver_2_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_3/mitra_driver_3_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_4/mitra_driver_4_screen.dart';
import 'package:mykurir/pages/daftar_mitra_driver_5/mitra_driver_5_screen.dart';
import 'package:mykurir/pages/detail_pesanan_on_deliv/detail_pesanan_on_deliv_screen.dart';
import 'package:mykurir/pages/detail_pesanan_selesai/detail_pesanan_selesai_screen.dart';
import 'package:mykurir/pages/edit_profil/edit_profil_screen.dart';
import 'package:mykurir/pages/error_reconect/error_reconect_screen.dart';
import 'package:mykurir/pages/error_wip/error_wip_screen.dart';
import 'package:mykurir/pages/ganti_email/ganti_email_screen.dart';
import 'package:mykurir/pages/hapus_akun_disetujui/hapus_akun_disetujui_screen.dart';
import 'package:mykurir/pages/keamanan_akun/keamanan_akun_screen.dart';
import 'package:mykurir/pages/login/login_screen.dart';
import 'package:mykurir/pages/lupa_password/lupa_password_screen.dart';
import 'package:mykurir/pages/lupa_password_input_new_password/lupa_password_input_new_password_screen.dart';
import 'package:mykurir/pages/lupa_password_otp/lupa_password_otp_screen.dart';
import 'package:mykurir/pages/lupa_password_validasi/lupa_password_validasi_screen.dart';
import 'package:mykurir/pages/masuk_no_HP/masuk_no_HP_screen.dart';
import 'package:mykurir/pages/notifikasi/notifikasi_screen.dart';
import 'package:mykurir/pages/opsi_hapus_akun/opsi_hapus_akun_screen.dart';
import 'package:mykurir/pages/permintaan_pesanan/permintaan_pesanan_screen.dart';
import 'package:mykurir/pages/pilih_role/pilihrole_screen.dart';
import 'package:mykurir/pages/profil/profil_screen.dart';
import 'package:mykurir/pages/pusatbantuan/pusatbantuan_screen.dart';
import 'package:mykurir/pages/rating_aplikasi/rating_aplikasi_screen.dart';
import 'package:mykurir/pages/rating_driver/rating_driver_screen.dart';
import 'package:mykurir/pages/report_customer/report_customer_screen.dart';
import 'package:mykurir/pages/report_customer_alasan/report_customer_alasan_screen.dart';
import 'package:mykurir/pages/report_driver/report_driver_screen.dart';
import 'package:mykurir/pages/setting/setting_screen.dart';
import 'package:mykurir/pages/verif_otp/verif_otp_screen.dart';
import 'package:mykurir/pages/terima_kasih_penilaian/terima_kasih_penilaian_screen.dart';

List<GetPage<dynamic>> routes = [
  // =========================================
  // 1. AUTENTIKASI & ONBOARDING (AUTH)
  // =========================================

  // Login & Daftar
  GetPage(name: "/beranda_sementara", page: () => BerandaSementara()),
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/daftar", page: () => DaftarScreen()),
  GetPage(name: "/pilih_role", page: () => PilihroleScreen()),

  // Verifikasi OTP
  GetPage(name: "/masukan_no_hp", page: () => MasukNoHPScreen()),
  GetPage(name: "/verif_otp", page: () => VerifOtpScreen()),

  // Lupa Password
  GetPage(name: "/lupa_password", page: () => LupaPasswordScreen()),
  GetPage(
    name: "/lupa_password_input_new_password",
    page: () => LupaPasswordInputNewPassword(),
  ),
  GetPage(name: "/lupa_password_otp", page: () => LupaPasswordOtpScreen()),
  GetPage(
    name: "/lupa_password_validasi",
    page: () => LupapasswordValidasiScreen(),
  ),

  // =========================================
  // 2. AKUN, PROFIL & PENGATURAN
  // =========================================

  // Profil User
  GetPage(name: "/profil", page: () => ProfilScreen()),
  GetPage(name: "/edit_profil", page: () => EditprofilScreen()),
  GetPage(name: "/ganti_email", page: () => GantiEmailScreen()),
  GetPage(name: "/keamanan_akun", page: () => KeamananAkunScreen()),

  // Setting Umum
  GetPage(name: "/setting", page: () => SettingScreen()),

  // Hapus Akun
  GetPage(name: "/opsi_hapus_akun", page: () => OpsiHapusAkunScreen()),
  GetPage(
    name: "/hapus_akun_disetujui",
    page: () => HapusAkunDisetujuiScreen(),
  ),

  // =========================================
  // 3. AKTIVITAS & PESANAN
  // =========================================

  // Aktivitas
  GetPage(
    name: "/aktivitas_berlangsung",
    page: () => AktivitasBerlangsungScreen(),
  ),
  GetPage(name: "/aktivitas_riwayat", page: () => AktivitasRiwayatScreen()),

  // Pesanan
  GetPage(name: "/permintaan_pesanan", page: () => PermintaanPesananScreen()),
  GetPage(
    name: "/detail_pesanan_on_deliv",
    page: () => DetailPesananOnDelivScreen(),
  ),
  GetPage(
    name: "/detail_pesanan_selesai",
    page: () => DetailPesananSelesaiScreen(),
  ),

  // =========================================
  // 4. PENDAFTARAN MITRA DRIVER
  // =========================================
  GetPage(name: "/daftar_mitra_driver_1", page: () => MitraDriver1Screen()),
  GetPage(name: "/daftar_mitra_driver_2", page: () => MitraDriver2Screen()),
  GetPage(name: "/daftar_mitra_driver_3", page: () => MitraDriver3Screen()),
  GetPage(name: "/daftar_mitra_driver_4", page: () => MitraDriver4Screen()),
  GetPage(name: "/daftar_mitra_driver_5", page: () => MitraDriver5Screen()),

  // =========================================
  // 5. BANTUAN, RATING & REPORT
  // =========================================

  // Pusat Bantuan & Notifikasi
  GetPage(name: "/pusat_bantuan", page: () => PusatBantuanScreen()),
  GetPage(name: "/notifikasi", page: () => NotifikasiScreen()),

  // Rating
  GetPage(name: "/rating_driver", page: () => RatingDriverScreen()),
  GetPage(name: "/rating_aplikasi", page: () => RatingAplikasiScreen()),
  GetPage(
    name: "/terima_kasih_penilaian",
    page: () => TerimakasihPenilaianScreen(),
  ),

  // Report
  GetPage(name: "/report_driver", page: () => ReportDriverScreen()),
  GetPage(
    name: "/report_driver_alasan",
    page: () => ReportCustomerAlasanScreen(),
  ),
  GetPage(name: "/report_customer", page: () => ReportCustomerScreen()),
  GetPage(
    name: "/report_customer_alasan",
    page: () => ReportCustomerAlasanScreen(),
  ),

  // =========================================
  // 6. HALAMAN ERROR & SISTEM
  // =========================================
  GetPage(name: "/error_reconect", page: () => ErrorReconectScreen()),
  GetPage(name: "/error_wip", page: () => ErrorWipScreen()),
];
