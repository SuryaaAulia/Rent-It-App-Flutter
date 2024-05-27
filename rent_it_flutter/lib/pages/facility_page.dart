import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/facility.dart';
import 'package:rent_it_flutter/pages/detail_facility_page.dart';
import 'package:rent_it_flutter/services/facility_service.dart';
import 'package:rent_it_flutter/utils/path_parse.dart';

class FacilityPage extends StatefulWidget {
  const FacilityPage({super.key});

  @override
  _FacilityPageState createState() => _FacilityPageState();
}

class _FacilityPageState extends State<FacilityPage> {
  late Future<List<Facility>> futureFacilities;

  @override
  void initState() {
    super.initState();
    futureFacilities = FacilityService().fetchFacilities();
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
        body: FutureBuilder<List<Facility>>(
          future: futureFacilities,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Failed to load facilities: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No facilities available'));
            }

            final facilities = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: facilities.map<Widget>((facility) {
                      return FacilityItem(
                        facility: facility,
                        image: AssetImage(
                            getLocalImagePath(facility.image..split(', ')[0])),
                        title: facility.name,
                        price: facility.price.toString(),
                        description: facility.description,
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final Facility facility;
  final AssetImage image;
  final String title;
  final String price;
  final String description;

  const FacilityItem({
    required this.facility,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFacilityPage(
              title: title,
              facility: facility,
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
                    'Rp $price',
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
