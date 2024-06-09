import 'package:rent_it_flutter/models/facility.dart';
import 'package:rent_it_flutter/services/service.dart';

class FacilityService {
  static const String url = 'http://10.0.2.2:8000/api/facilities';
  final Service<Facility> _service = Service<Facility>(
    url: url,
    fromJson: (json) => Facility.fromJson(json),
  );

  Future<List<Facility>> fetchFacilities() async {
    return await _service.fetchItems();
  }
}
