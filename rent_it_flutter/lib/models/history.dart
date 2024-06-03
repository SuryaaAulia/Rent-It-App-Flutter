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
    );
  }
}
