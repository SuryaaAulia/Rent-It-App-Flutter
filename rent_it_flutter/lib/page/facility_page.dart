import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rent_it_flutter/page/detail_facility_page.dart';

class FacilityPage extends StatefulWidget {
  const FacilityPage({Key? key}) : super(key: key);

  @override
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  List<dynamic> facilities = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/facilities'));
      if (response.statusCode == 200) {
        setState(() {
          facilities = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage =
              'Failed to load data. Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load data. Error: $e';
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  String _getLocalImagePath(String apiImagePath) {
    // Map API image names to local assets
    String imageName = apiImagePath.split('/').last;
    return 'assets/images/$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Facility Page',
            style: TextStyle(color: Color.fromRGBO(217, 217, 217, 1)),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(159, 21, 33, 1),
                  Color.fromRGBO(226, 42, 50, 1)
                ],
              ),
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(236, 232, 232, 1),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : errorMessage != null
                ? Center(child: Text(errorMessage!))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: facilities.map<Widget>((facility) {
                            return FacilityItems(
                              image: AssetImage(_getLocalImagePath(
                                  facility['image'].split(', ')[0])),
                              title: facility['name'],
                              price: 'Rp. ${facility['price'].toString()}',
                              description: facility['description'],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}

class FacilityItems extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String price;
  final String description;

  const FacilityItems({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFacilityPage(
              title: title,
              item: this,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: image,
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
