import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/facility.dart';

class FacilityService {
  static const String url = 'http://10.0.2.2:8000/api/facilities';

  Future<List<Facility>> fetchFacilities() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Facility> facilities =
            body.map((dynamic item) => Facility.fromJson(item)).toList();
        return facilities;
      } else {
        throw Exception(
            'Failed to load facilities. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load facilities. Error: $e');
    }
  }
}
