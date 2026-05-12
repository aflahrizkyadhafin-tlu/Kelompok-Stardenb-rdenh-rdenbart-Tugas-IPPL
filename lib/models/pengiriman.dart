enum StatusPengiriman { pickup, on_delivery, delivered, cancelled }

class Pengiriman {
  final String idPengiriman;
  final String nomorResi;
  final String deskripsiBarang;
  final String alamatPengirim;
  final String alamatPenerima;
  final String namaPenerima;
  final String nomorTeleponPenerima;
  final double berat;
  final int biaya;
  final DateTime waktuOrder;
  final StatusPengiriman statusPengiriman;
  final String idAkun;
  final String idKurir;

  Pengiriman({
    required this.idPengiriman,
    required this.nomorResi,
    required this.deskripsiBarang,
    required this.alamatPengirim,
    required this.alamatPenerima,
    required this.namaPenerima,
    required this.nomorTeleponPenerima,
    required this.berat,
    required this.biaya,
    required this.waktuOrder,
    required this.statusPengiriman,
    required this.idAkun,
    required this.idKurir,
  });

  factory Pengiriman.fromJson(Map<String, dynamic> json) {
    return Pengiriman(
      idPengiriman: json['id_pengiriman'] ?? '',
      nomorResi: json['nomor_resi'] ?? '',
      deskripsiBarang: json['deskripsi_barang'] ?? '',
      alamatPengirim: json['alamat_pengirim'] ?? '',
      alamatPenerima: json['alamat_penerima'] ?? '',
      namaPenerima: json['nama_penerima'] ?? '',
      nomorTeleponPenerima: json['nomor_telepon_penerima'] ?? '',
      berat: (json['berat'] ?? 0.0).toDouble(),
      biaya: json['biaya'] ?? 0,
      waktuOrder: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      statusPengiriman: StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pickup,
      ),
      idAkun: json['id_akun'] ?? '',
      idKurir: json['id_kurir'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_pengiriman': idPengiriman,
      'nomor_resi': nomorResi,
      'deskripsi_barang': deskripsiBarang,
      'alamat_pengirim': alamatPengirim,
      'alamat_penerima': alamatPenerima,
      'nama_penerima': namaPenerima,
      'nomor_telepon_penerima': nomorTeleponPenerima,
      'berat': berat,
      'biaya': biaya,
      'created_at': waktuOrder.toIso8601String(),
      'status_pengiriman': statusPengiriman.name,
      'id_akun': idAkun,
      'id_kurir': idKurir,
    };
  }
}
