import 'package:flutter/material.dart';
import 'package:rent_it_flutter/models/facility.dart';
import 'package:rent_it_flutter/utils/path_parse.dart';
import 'package:rent_it_flutter/widgets/box_decorations.dart';
import 'package:rent_it_flutter/widgets/image_overlay_widget.dart';
import 'package:rent_it_flutter/widgets/text_overlay.dart';

class DropdownRentWidget extends StatelessWidget {
  final List<Facility> facilities;
  final Facility selectedFacility;
  final ValueChanged<Facility?> onChanged;

  const DropdownRentWidget({
    super.key,
    required this.facilities,
    required this.selectedFacility,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    const rGray = Color.fromRGBO(236, 232, 232, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Container(
            width: screenWidth * 0.9,
            height: 50,
            decoration: redRoundedDropdownDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Facility>(
                  value: selectedFacility,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  dropdownColor: Colors.red,
                  onChanged: onChanged,
                  items: facilities
                      .map<DropdownMenuItem<Facility>>((Facility facility) {
                    return DropdownMenuItem<Facility>(
                      value: facility,
                      child: Text(
                        facility.name,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedFacility.name == facility.name
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ROverlayImage(
                  screenWidth: screenWidth * 0.9,
                  screenHeight: screenHeight * 0.25,
                  image: AssetImage(getLocalImagePath(selectedFacility.image
                      .split(', ')[0])), // Updated to use NetworkImage
                ),
                RTopTextOverlay(
                  borderStyle: BoxShape.circle,
                  border: Border.all(
                      style: BorderStyle.solid, color: rGray, width: 2),
                  screenWidth: screenWidth,
                  color: rGray,
                  tanggal: 'Rp ${selectedFacility.price}',
                ),
                RBottomTextOverlay(
                  sizeNamaGedung: 20,
                  color: rGray,
                  namaGedung: selectedFacility.name,
                  descGedung: selectedFacility.description,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
