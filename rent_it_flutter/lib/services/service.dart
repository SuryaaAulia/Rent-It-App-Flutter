import 'dart:convert';
import 'package:http/http.dart' as http;

class Service<T> {
  final String url;
  final T Function(dynamic) fromJson;
  final String listKey; // Tambahkan parameter listKey

  Service(
      {required this.url,
      required this.fromJson,
      this.listKey = 'data'}); // Tetapkan nilai default untuk listKey

  Future<List<T>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> itemsList =
            body[listKey]; // Gunakan listKey untuk mengakses daftar item
        List<T> items =
            itemsList.map((dynamic item) => fromJson(item)).toList();
        return items;
      } else {
        throw Exception(
            'Failed to load items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load items. Error: $e');
    }
  }
}
