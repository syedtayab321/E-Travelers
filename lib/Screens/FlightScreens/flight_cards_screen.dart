import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/FlightControllers/flight_controller.dart';
import '../../Utils/app_colors.dart';

class FlightCardsScreen extends StatelessWidget {
  final FlightController flightController = Get.put(FlightController());
  FlightCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: "Flight Details", color: AppColors.primary),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: flightController.flights.length,
          itemBuilder: (context, index) {
            final flight = flightController.flights[index];

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                  text:flight.price,
                  fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset("assets/images/logo1.jpg", height: 24),
                      const SizedBox(width: 8),
                      CustomTextWidget(text:flight.airline, fontSize: 16, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text:flight.departureTime,fontSize: 16, fontWeight: FontWeight.bold),
                          CustomTextWidget(text:flight.departureAirport,color: Colors.grey),
                          CustomTextWidget(text:flight.departureDate, color: Colors.grey),
                        ],
                      ),
                      Column(
                        children: [
                          CustomTextWidget(text:flight.duration, color: Colors.grey),
                          const Icon(Icons.airplanemode_active, color: Colors.grey),
                          CustomTextWidget(text:flight.stops,color: Colors.grey),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextWidget(text:flight.arrivalTime, fontSize: 16, fontWeight: FontWeight.bold),
                          CustomTextWidget(text:flight.arrivalAirport,color: Colors.grey),
                          CustomTextWidget(text:flight.arrivalDate, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      flight.refundable
                          ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(8)),
                        child: const CustomTextWidget(text:"Refundable",color: Colors.green, fontSize: 12),
                      ) : const SizedBox(),
                      flight.seatsLeft > 0
                          ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.yellow.shade100, borderRadius: BorderRadius.circular(8)),
                        child: CustomTextWidget(text:"${flight.seatsLeft} Seats left", color: Colors.yellow.shade800, fontSize: 12),
                      ) : const SizedBox(),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
