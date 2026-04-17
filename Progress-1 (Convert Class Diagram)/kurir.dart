// Kelompok : Stardenbürdenhärdenbart
// Nama : Aflah Rizkyadhafin Nurfikri
// NIM : 103112400223

import 'dart:io';

import 'akun.dart';

class kurir extends akun {
  String
  id_kurir; // Karena tidak ada tipe data UUID bawaan dart, maka diganti dengan String
  double rating;
  String lokasi, kendaraan, platNomer, status_kurir, id_akun;

  kurir({
    required this.id_kurir,
    required this.rating,
    required this.lokasi,
    required this.kendaraan,
    required this.platNomer,
    required this.status_kurir,
    required this.id_akun,
  });

  static const List<String> _validStatus = [
    "offline",
    "avaible",
    "on_delivery",
  ];

  void terimaPesanan(String nomor_resi) {
    print("Kurir menerima pesanan");
    print("Nomor resi : $nomor_resi");
    print("Nama pengirim : Aflah RN");
    print("Alamat pengirim : Pasar Wage");
    print("Nama penerima : Nadip Ahnaf");
    print("Alamat penerima : Taman Maskemambang");
    print("Deskripsi barang : Beras Pandanwangi");
    print("Berat : 15kg");
    print("Biaya : Rp 45000");
  }

  void batalkanPesanan() {
    print("Batalkan pesanan saat ini ? ");
    bool? konfirmasi = bool.parse(stdin.readLineSync()!);
    if (konfirmasi) {
      print("Order pengiriman telah dibatalkan");
    }
  }

  void perbaruiLokasi(String lokasi) {
    this.lokasi = lokasi;
  }

  void ubahStatus(String status) {
    if (_validStatus.contains(status)) {
      this.status_kurir = status;
    }
  }

  void selasaikanPesanan() {
    print("Barang selesai diantar? ");
    bool konfirmasi = bool.parse(stdin.readLineSync()!);
    if (konfirmasi) {
      print("Pengiriman barang telah selesai!!!");
    }
  }

  double lihatRating() {
    return this.rating;
  }
}
