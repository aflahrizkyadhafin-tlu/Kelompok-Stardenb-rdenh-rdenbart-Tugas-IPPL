class Laporan {
  final String? idLaporan;
  final DateTime? createdAt;
  final String? pesan;
  final String? reporterId;
  final String? reportedId;

  Laporan({
    this.idLaporan,
    this.createdAt,
    this.pesan,
    this.reporterId,
    this.reportedId,
  });

  factory Laporan.fromJson(Map<String, dynamic> json) {
    return Laporan(
      idLaporan: json['id_laporan'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      pesan: json['pesan'] as String?,
      reporterId: json['reporter_id'] as String,
      reportedId: json['reported_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_laporan': idLaporan,
      'created_at': createdAt!.toIso8601String(),
      'pesan': pesan,
      'reporter_id': reporterId,
      'reported_id': reportedId,
    };
    jsonData.removeWhere((k, v) => v == "" || v == null);
    return jsonData;
  }
}
