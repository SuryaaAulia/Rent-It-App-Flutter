import 'package:flutter/material.dart';

class History {
  final int userId;
  final int facilityId;
  final String tanggalPemesanan;
  final String status;
  final String namaFile;
  final String filePath;
  final String nomorTlp;
  final String? note;
  final String desc;
  final String image;
  final String namaGedung;
  final int kategori;
  final int harga;

  History({
    required this.userId,
    required this.facilityId,
    required this.tanggalPemesanan,
    required this.status,
    required this.namaFile,
    required this.filePath,
    required this.nomorTlp,
    required this.note,
    required this.desc,
    required this.image,
    required this.namaGedung,
    required this.kategori,
    required this.harga,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      userId: json['user_id'],
      facilityId: json['facility_id'],
      tanggalPemesanan: json['tanggal_pemesanan'],
      status: json['status'],
      namaFile: json['nama_file'],
      filePath: json['file_path'],
      nomorTlp: json['nomor_tlp'],
      note: json['note'],
      desc: json['facility']['description'],
      image: json['facility']['image'],
      namaGedung: json['facility']['name'],
      kategori: json['facility']['category_id'],
      harga: json['facility']['price'],
    );
  }
  String get categoryName {
    switch (kategori) {
      case 1:
        return 'Fasilitas Kelas';
      case 2:
        return 'Fasilitas Gedung';
      case 3:
        return 'Fasilitas Olahraga';
      default:
        return 'Unknown';
    }
  }

  Color get statusBackgroundColor {
    switch (status) {
      case 'Rejected':
      case 'Canceled':
        return Colors.red.withOpacity(0.5);
      case 'Waiting':
        return Colors.orange.withOpacity(0.5);
      case 'Completed':
        return Colors.green.withOpacity(0.5);
      default:
        return Colors.grey.withOpacity(0.5);
    }
  }

  Color get statusTextColor {
    switch (status) {
      case 'Rejected':
      case 'Canceled':
        return Colors.red;
      case 'Waiting':
        return Colors.orange;
      case 'Completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
