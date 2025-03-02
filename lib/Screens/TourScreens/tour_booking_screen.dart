import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/TourControllers/tour_booking_controller.dart';

class TourBookingScreen extends StatelessWidget {
  TourBookingScreen({super.key});

  final TourBookingController _controller = Get.put(TourBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Tour Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tour Details Section
            _buildTourDetails(),
            const SizedBox(height: 20),

            // Booking Form Section
            _buildBookingForm(context),
            const SizedBox(height: 20),

            // Submit Button
            Obx(() => _controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
              onPressed: _controller.submitBooking,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const CustomTextWidget(text: 'Book Now'),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTourDetails() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
             text:  _controller.tourName,
             fontSize: 24, fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            CustomTextWidget(
             text:  _controller.tourDescription,
             fontSize: 16, color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                 text:  'Price: \$${_controller.tourPrice.toStringAsFixed(2)}',
                 fontSize: 18, fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(
                 text:  'Duration: ${_controller.tourDuration}',
                    fontSize: 18, fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingForm(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomTextWidget(
             text:  'Booking Details',
            fontSize: 20, fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              onChanged: _controller.fullName.call,
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: _controller.email.call,
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              onChanged: _controller.phoneNumber.call,
            ),
            const SizedBox(height: 15),
            Obx(() => TextFormField(
              decoration: InputDecoration(
                labelText: 'Booking Date',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _controller.selectBookingDate(context),
                ),
              ),
              controller: TextEditingController(text: _controller.bookingDate.value),
              readOnly: true,
            )),
            const SizedBox(height: 15),
            Obx(() => Row(
              children: [
                const CustomTextWidget(text: 'Number of Guests:'),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_controller.numberOfGuests.value > 1) {
                      _controller.numberOfGuests.value--;
                    }
                  },
                ),
                Text(_controller.numberOfGuests.value.toString()),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _controller.numberOfGuests.value++;
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}