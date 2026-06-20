// Enum untuk Status Dokumen
enum StatusDokumen { pending, verified, cancelled }

class Dokumen {
  final int? idDokumen;
  final DateTime? createdAt;
  final String? kartuIdentitas;
  final String? suratIzinMengemudi;
  final String? idAkun;
  final StatusDokumen? status;

  Dokumen({
    this.idDokumen,
    this.createdAt,
    this.kartuIdentitas,
    this.suratIzinMengemudi,
    this.idAkun,
    this.status,
  });

  factory Dokumen.fromJson(Map<String, dynamic> json) {
    StatusDokumen? statusEnum;
    if (json['status'] != null) {
      statusEnum = StatusDokumen.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => StatusDokumen.pending,
      );
    }

    return Dokumen(
      idDokumen: json['id_dokumen'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      kartuIdentitas: json['kartu_identitas'] as String?,
      suratIzinMengemudi: json['surat_izin_mengemudi'] as String?,
      idAkun: json['id_akun'] as String?,
      status: statusEnum,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonData = {
      'id_dokumen': idDokumen,
      'created_at': createdAt?.toIso8601String(),
      'kartu_identitas': kartuIdentitas,
      'surat_izin_mengemudi': suratIzinMengemudi,
      'id_akun': idAkun,
      'status': status?.name,
    };

    jsonData.removeWhere((k, v) => v == null || v == "");

    return jsonData;
  }
}
