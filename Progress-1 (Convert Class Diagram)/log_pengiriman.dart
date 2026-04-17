// Kelompok : Stardenbürdenhärdenbart
// Nama : Muhammad Rizqi Ar Rafi
// NIM : 103112400218

class LogPengiriman {
  String idLog;
  String statusPengiriman;
  DateTime waktuUpdate;
  String idPengiriman;
  String? keterangan;

  static const List<String> _validStatus = [
    'pickup',
    'on_delivery',
    'delivered',
    'cancelled',
  ];

  static const Map<String, String> _pesanStatus = {
    'pickup' : 'Kurir sedang menjemput paket.',
    'on_delivery' : 'Paket sedang dalam perjalanan ke penerima.',
    'delivered' : 'Paket berhasil diterima.',
    'cancelled' : 'Pengiriman dibatalkan.',
  };

  LogPengiriman({
    String? idLog,
    required this.statusPengiriman,
    required this.idPengiriman,
    DateTime? waktuUpdate,
    this.keterangan,
  }) : idLog = idLog ?? const Uuid().v4(),
        waktuUpdate = waktuUpdate ?? DateTime.now() {
    if (!_validStatus.contains(statusPengiriman)) {
      throw ArgumentError(
        'Status pengiriman tidak valid. Pilihan yang tersedia: ${_validStatus.join(', ')}',
      );
    }
  }

  void catatLog() {
    print('=== LOG PENGIRIMAN ===');
    print('ID Log : $idLog');
    print('ID Pengiriman : $idPengiriman');
    print('Status : $statusPengiriman');
    print('Detail : ${_pesanStatus[statusPengiriman]}');
    print('Keterangan : ${keterangan ?? '-'}');
    print('Waktu Update : $waktuUpdate');
    print('=====================');
  }

  static List<LogPengiriman> riwayatLog(
    List<LogPengiriman> daftarLog,
    String idPengiriman,
  ) {
    return daftarLog
        .where((log) => log.idPengiriman == idPengiriman)
        .toList()
        ..sort((a, b) => a.waktuUpdate.compareTo(b.waktuUpdate));
  }

  @override
  String toString() {
    return 'LogPengiriman(idLog: $idLog, status: $statusPengiriman, '
        'detail: ${_pesanStatus[statusPengiriman]}, '
        'keterangan: ${keterangan ?? '-'}, '
        'waktuUpdate: $waktuUpdate, idPengiriman: $idPengiriman)';
  }
}