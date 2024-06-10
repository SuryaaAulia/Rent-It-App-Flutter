import 'dart:convert';
import 'package:http/http.dart' as http;

class Service<T> {
  final String url;
  final T Function(dynamic) fromJson;

  Service({required this.url, required this.fromJson});

  Future<List<T>> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<T> items = body.map((dynamic item) => fromJson(item)).toList();
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
