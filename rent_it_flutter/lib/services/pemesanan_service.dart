import 'package:rent_it_flutter/models/pemesanan.dart'; // Import Pemesanan model
import 'package:rent_it_flutter/services/service.dart';

class PemesananService {
  static const String url = 'http://10.0.2.2:8000/api/pemesanans';
  final Service<Pemesanan> _service = Service<Pemesanan>(
    url: url,
    fromJson: (json) => Pemesanan.fromJson(json),
    listKey: 'data', // Gunakan 'data' sebagai kunci untuk daftar pemesanan
  );

  Future<List<Pemesanan>> fetchPemesanans() async {
    return await _service.fetchItems();
  }
}
