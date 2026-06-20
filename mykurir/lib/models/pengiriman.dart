enum StatusPengiriman { pending, pickup, on_delivery, delivered, cancelled }

enum DimensiBarang { kecil, sedang, besar }

class Pengiriman {
  final String? idPengiriman;
  final String? nomorResi;
  final String? deskripsiBarang;
  final String? alamatPengirim;
  final String? alamatPenerima;
  final String? namaPenerima;
  final String? nomorTeleponPenerima;
  final double? berat;
  final int? biaya;
  final StatusPengiriman? statusPengiriman;
  final DateTime? createdAt;
  final String? idAkun;
  final String? idKurir;
  final double? longPengirim;
  final double? latPengirim;
  final double? longPenerima;
  final double? latPenerima;
  final DimensiBarang? ukuran;

  Pengiriman({
    this.idPengiriman,
    this.nomorResi,
    this.deskripsiBarang,
    this.alamatPengirim,
    this.alamatPenerima,
    this.namaPenerima,
    this.nomorTeleponPenerima,
    this.berat,
    this.biaya,
    this.statusPengiriman,
    this.createdAt,
    this.idAkun,
    this.idKurir,
    this.longPengirim,
    this.latPengirim,
    this.longPenerima,
    this.latPenerima,
    this.ukuran,
  });

  factory Pengiriman.fromJson(Map<String, dynamic> json) {
    StatusPengiriman? statusEnum;
    if (json['status_pengiriman'] != null) {
      statusEnum = StatusPengiriman.values.firstWhere(
        (e) => e.name == json['status_pengiriman'],
        orElse: () => StatusPengiriman.pending,
      );
    }

    DimensiBarang? ukuranEnum;
    if (json['ukuran'] != null) {
      ukuranEnum = DimensiBarang.values.firstWhere(
        (e) => e.name == json['ukuran'],
        orElse: () => DimensiBarang.kecil,
      );
    }

    return Pengiriman(
      idPengiriman: json['id_pengiriman'] as String?,
      nomorResi: json['nomor_resi'] as String?,
      deskripsiBarang: json['deskripsi_barang'] as String?,
      alamatPengirim: json['alamat_pengirim'] as String?,
      alamatPenerima: json['alamat_penerima'] as String?,
      namaPenerima: json['nama_penerima'] as String?,
      nomorTeleponPenerima: json['nomor_telepon_penerima'] as String?,
      berat: (json['berat'] as num?)?.toDouble(),
      biaya: json['biaya'] as int?,
      statusPengiriman: statusEnum,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      idAkun: json['id_akun'] as String?,
      idKurir: json['id_kurir'] as String?,
      longPengirim: (json['long_pengirim'] as num?)?.toDouble(),
      latPengirim: (json['lat_pengirim'] as num?)?.toDouble(),
      longPenerima: (json['long_penerima'] as num?)?.toDouble(),
      latPenerima: (json['lat_penerima'] as num?)?.toDouble(),
      ukuran: ukuranEnum,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_pengiriman': idPengiriman,
      'nomor_resi': nomorResi,
      'deskripsi_barang': deskripsiBarang,
      'alamat_pengirim': alamatPengirim,
      'alamat_penerima': alamatPenerima,
      'nama_penerima': namaPenerima,
      'nomor_telepon_penerima': nomorTeleponPenerima,
      'berat': berat,
      'biaya': biaya,
      'status_pengiriman': statusPengiriman?.name,
      'created_at': createdAt?.toIso8601String(),
      'id_akun': idAkun,
      'id_kurir': idKurir,
      'long_pengirim': longPengirim,
      'lat_pengirim': latPengirim,
      'long_penerima': longPenerima,
      'lat_penerima': latPenerima,
      'ukuran': ukuran?.name,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
