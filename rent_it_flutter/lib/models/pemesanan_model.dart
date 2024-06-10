import 'dart:convert';

class Pemesanan {
  final int id;
  final int userId;
  final int facilityId;
  final String tanggalPemesanan;
  final String status;
  final String namaFile;
  final String facilityName;

  Pemesanan({
    required this.id,
    required this.userId,
    required this.facilityId,
    required this.tanggalPemesanan,
    required this.status,
    required this.namaFile,
    required this.facilityName,
  });

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json['id'],
      userId: json['user_id'],
      facilityId: json['facility_id'],
      tanggalPemesanan: json['tanggal_pemesanan'],
      status: json['status'],
      namaFile: json['nama_file'],
      facilityName: json['facility_name'],
    );
  }
}

class NotificationData {
  final String message;
  final List<Pemesanan> daftar;

  NotificationData({required this.message, required this.daftar});

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    var daftarJson = json['data']['daftar'] as List;
    List<Pemesanan> daftarPemesanan =
        daftarJson.map((pemesanan) => Pemesanan.fromJson(pemesanan)).toList();

    return NotificationData(
      message: json['message'],
      daftar: daftarPemesanan,
    );
  }
}
