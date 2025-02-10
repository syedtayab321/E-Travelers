import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategorySection extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': FontAwesomeIcons.plane, 'label': 'Flight'},
    {'icon': FontAwesomeIcons.box, 'label': 'Package'},
    {'icon': FontAwesomeIcons.hotel, 'label': 'Hotel'},
    {'icon': FontAwesomeIcons.bus, 'label': 'Bus'},
    {'icon': FontAwesomeIcons.train, 'label': 'Train'},
  ];
  CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories.map((category) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 25,
                child: FaIcon(category['icon'], color: Colors.redAccent),
              ),
              const SizedBox(height: 8),
              CustomTextWidget(
                  text:category['label'],
                  color: Colors.black87
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}