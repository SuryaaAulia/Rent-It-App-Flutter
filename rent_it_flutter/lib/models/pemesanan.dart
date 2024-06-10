class Pemesanan {
  final int id;
  final int userId;
  final int facilityId;
  final String? kelasId;
  final String tanggalPemesanan;
  final String status;
  final String namaFile;
  final String filePath;
  final String nomorTlp;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  final String name;
  final int categoryId;
  final String slug;
  final String description;
  final List<String> images;
  final int price;

  Pemesanan({
    required this.id,
    required this.userId,
    required this.facilityId,
    required this.kelasId,
    required this.tanggalPemesanan,
    required this.status,
    required this.namaFile,
    required this.filePath,
    required this.nomorTlp,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.categoryId,
    required this.slug,
    required this.description,
    required this.images,
    required this.price,
  });

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json['id'],
      userId: json['user_id'],
      facilityId: json['facility_id'],
      kelasId: json['kelas_id'],
      tanggalPemesanan: json['tanggal_pemesanan'],
      status: json['status'],
      namaFile: json['nama_file'],
      filePath: json['file_path'],
      nomorTlp: json['nomor_tlp'],
      note: json['note'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      categoryId: json['category_id'],
      slug: json['slug'],
      description: json['description'],
      images: (json['image'] as String).split(', ').map((e) => e.trim()).toList(),
      price: json['price'],
    );
  }
}
