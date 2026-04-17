class Pengiriman {
  String idPengiriman;
  String nomorResi;
  String deskripsiBarang;
  String alamatPengirim;
  String alamatPenerima;
  String namaPenerima;
  String nomorTeleponPenerima;
  double berat;
  int biaya;
  DateTime waktuOrder;
  String statusPengiriman;
  String idAkun;
  String idKurir;

  static const List<String> _validStatus = [
    'pickup',
    'Sedang Diantar',
    'Sedang dikirim',
    'Pesanan Dibatalkan',
  ];

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
  
  int hitungBiaya(double beratBarang) {
    return 0; 
  }

  String tunjukKurir(String idKurirBaru) {
    return ''; 
  }

  bool perbaruiStatus(String statusBaru) {
    return _validStatus.contains(statusBaru);
  }

  String buatResi(String idPengirimanBaru) {
    return ''; 
  }
}
