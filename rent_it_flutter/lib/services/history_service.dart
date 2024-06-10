import 'package:rent_it_flutter/models/history.dart'; // Import Facility model
import 'package:rent_it_flutter/services/service.dart';

class HistoryService {
  static const String url = 'https://rent-it.site/api/histories';
  final Service<History> _service = Service<History>(
    url: url,
    fromJson: (json) => History.fromJson(json),
  );

  Future<List<History>> fetchHistories() async {
    return await _service.fetchItems();
  }
}
