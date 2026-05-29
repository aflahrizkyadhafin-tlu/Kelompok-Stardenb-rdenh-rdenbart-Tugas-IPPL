enum StatusPengiriman { pending, pickup, on_delivery, delivered, cancelled }

class Pengiriman {
  final String? idPengiriman;
  final String nomorResi;
  final String deskripsiBarang;
  final double berat;
  final int biaya;
  final StatusPengiriman statusPengiriman;
  final DateTime? createdAt;
  final String namaPenerima;
  final String nomorTeleponPenerima;
  final String alamatPenerima;
  final double latPenerima;
  final double longPenerima;
  final String alamatPengirim;
  final double latPengirim;
  final double longPengirim;
  final String idPelanggan;
  final String? idKurir;

  Pengiriman({
    this.idPengiriman,
    required this.nomorResi,
    required this.deskripsiBarang,
    required this.berat,
    required this.biaya,
    required this.statusPengiriman,
    this.createdAt,
    required this.namaPenerima,
    required this.nomorTeleponPenerima,
    required this.alamatPenerima,
    required this.latPenerima,
    required this.longPenerima,
    required this.alamatPengirim,
    required this.latPengirim,
    required this.longPengirim,
    required this.idPelanggan,
    this.idKurir,
  });

  factory Pengiriman.fromJson(Map<String, dynamic> json) {
    return Pengiriman(
      idPengiriman: json['id_pengiriman'] as String?,
      nomorResi: json['nomor_resi'] as String,
      deskripsiBarang: json['deskripsi_barang'] as String,
      berat: (json['berat'] as num).toDouble(),
      biaya: json['biaya'] as int,
      statusPengiriman: StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pending,
      ),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      namaPenerima: json['nama_penerima'] as String,
      nomorTeleponPenerima: json['nomor_telepon_penerima'] as String,
      alamatPenerima: json['alamat_penerima'] as String,
      latPenerima: (json['lat_penerima'] as num).toDouble(),
      longPenerima: (json['long_penerima'] as num).toDouble(),
      alamatPengirim: json['alamat_pengirim'] as String,
      latPengirim: (json['lat_pengirim'] as num).toDouble(),
      longPengirim: (json['long_pengirim'] as num).toDouble(),
      idPelanggan: json['id_pelanggan'] as String,
      idKurir: json['id_kurir'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_pengiriman': idPengiriman,
      'nomor_resi': nomorResi,
      'deskripsi_barang': deskripsiBarang,
      'berat': berat,
      'biaya': biaya,
      'status_pengiriman': statusPengiriman.name,
      'created_at': createdAt?.toIso8601String(),
      'nama_penerima': namaPenerima,
      'nomor_telepon_penerima': nomorTeleponPenerima,
      'alamat_penerima': alamatPenerima,
      'lat_penerima': latPenerima,
      'long_penerima': longPenerima,
      'alamat_pengirim': alamatPengirim,
      'lat_pengirim': latPengirim,
      'long_pengirim': longPengirim,
      'id_pelanggan': idPelanggan,
      'id_kurir': idKurir,
    };

    jsonData.removeWhere(
      (key, value) => (value == null || value == "") && key != "id_kurir",
    );

    return jsonData;
  }
}
