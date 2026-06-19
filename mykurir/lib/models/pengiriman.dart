enum StatusPengiriman { pending, pickup, on_delivery, delivered, cancelled }

enum UkuranPengiriman { kecil, sedang, besar }

class Pengiriman {
  String? idPengiriman;
  String? nomorResi;
  String? deskripsiBarang;
  double? berat;
  int? biaya;
  StatusPengiriman? statusPengiriman;
  DateTime? createdAt;
  String? namaPenerima;
  String? nomorTeleponPenerima;
  String? alamatPenerima;
  double? latPenerima;
  double? longPenerima;
  String? alamatPengirim;
  double? latPengirim;
  double? longPengirim;
  String? idPelanggan;
  String? idKurir;
  UkuranPengiriman? ukuran;

  Pengiriman({
    this.idPengiriman,
    this.nomorResi,
    this.deskripsiBarang,
    this.berat,
    this.biaya,
    this.statusPengiriman,
    this.createdAt,
    this.namaPenerima,
    this.nomorTeleponPenerima,
    this.alamatPenerima,
    this.latPenerima,
    this.longPenerima,
    this.alamatPengirim,
    this.latPengirim,
    this.longPengirim,
    this.idPelanggan,
    this.idKurir,
    this.ukuran,
  });

  factory Pengiriman.fromJson(Map<String, dynamic> json) {
    return Pengiriman(
      idPengiriman: json['id_pengiriman'] as String?,
      nomorResi: json['nomor_resi'] as String?,
      deskripsiBarang: json['deskripsi_barang'] as String?,
      berat: json['berat'] != null ? (json['berat'] as num).toDouble() : null,
      biaya: json['biaya'] != null ? (json['biaya'] as num).toInt() : null,
      statusPengiriman: json['status_pengiriman'] != null
          ? StatusPengiriman.values.firstWhere(
              (e) => e.name == json['status_pengiriman'],
              orElse: () => StatusPengiriman.pending,
            )
          : StatusPengiriman.pending,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      namaPenerima: json['nama_penerima'] as String?,
      nomorTeleponPenerima: json['nomor_telepon_penerima'] as String?,
      alamatPenerima: json['alamat_penerima'] as String?,
      latPenerima: json['lat_penerima'] != null
          ? (json['lat_penerima'] as num).toDouble()
          : null,
      longPenerima: json['long_penerima'] != null
          ? (json['long_penerima'] as num).toDouble()
          : null,
      alamatPengirim: json['alamat_pengirim'] as String?,
      latPengirim: json['lat_pengirim'] != null
          ? (json['lat_pengirim'] as num).toDouble()
          : null,
      longPengirim: json['long_pengirim'] != null
          ? (json['long_pengirim'] as num).toDouble()
          : null,
      idPelanggan: json['id_pelanggan'] as String?,
      idKurir: json['id_kurir'] as String?,
      ukuran: json['ukuran'] != null
          ? UkuranPengiriman.values.firstWhere(
              (e) => e.name == json['ukuran'],
              orElse: () => UkuranPengiriman.kecil,
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_pengiriman': idPengiriman,
      'nomor_resi': nomorResi,
      'deskripsi_barang': deskripsiBarang,
      'berat': berat,
      'biaya': biaya,
      'status_pengiriman': statusPengiriman?.name,
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
      'ukuran': ukuran?.name,
    };

    jsonData.removeWhere(
      (key, value) => (value == null || value == "") && key != "id_kurir",
    );

    return jsonData;
  }
}
