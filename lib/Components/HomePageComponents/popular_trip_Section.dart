import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/FlightScreens/flight_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularTripsSection extends StatelessWidget {
  final List<Map<String, String>> trips = [
    {'image': 'assets/images/background2.jpg', 'location': 'Ubud, Bali', 'price': '\$300', 'date': '25 Jan - 2 Feb'},
    {'image': 'assets/images/background2.jpg', 'location': 'Padar Island, NT', 'price': '\$340', 'date': '10 Feb - 18 Feb'},
    {'image': 'assets/images/background2.jpg', 'location': 'Padar Island, NT', 'price': '\$340', 'date': '10 Feb - 18 Feb'},
    {'image': 'assets/images/background2.jpg', 'location': 'Padar Island, NT', 'price': '\$340', 'date': '10 Feb - 18 Feb'},
    {'image': 'assets/images/background2.jpg', 'location': 'Padar Island, NT', 'price': '\$340', 'date': '10 Feb - 18 Feb'},
    {'image': 'assets/images/background2.jpg', 'location': 'Padar Island, NT', 'price': '\$340', 'date': '10 Feb - 18 Feb'},
  ];
   PopularTripsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(FlightDetailsScreen());
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                        trips[index]['image']!,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                          text:trips[index]['location']!,
                          fontWeight: FontWeight.bold
                      ),
                      CustomTextWidget(
                          text: trips[index]['price']!,
                          color: Colors.redAccent
                      ),
                      CustomTextWidget(
                          text:trips[index]['date']!,
                          fontSize: 12, color: Colors.grey
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}