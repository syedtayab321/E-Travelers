import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../Controllers/VisaControllers/visa_booking_controller.dart';

class VisaBookingPage extends StatelessWidget {
  VisaBookingPage({super.key});

  final VisaBookingController _controller = Get.put(VisaBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(text: 'Visa Booking'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Personal Details Section
            _buildPersonalDetailsForm(),
            const SizedBox(height: 20),

            // Document Upload Section
            _buildDocumentUploadSection(),
            const SizedBox(height: 20),

            // Submit Button
            Obx(() => _controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _controller.submitForm,
              child: const Text('Submit Application'),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsForm() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Personal Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Passport Number',
                border: OutlineInputBorder(),
              ),
              onChanged: _controller.passportNumber.call,
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nationality',
                border: OutlineInputBorder(),
              ),
              onChanged: _controller.nationality.call,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentUploadSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Upload Documents',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: _controller.uploadedDocuments.map((file) {
                return ListTile(
                  title: Text(file.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _controller.uploadedDocuments.remove(file);
                    },
                  ),
                );
              }).toList(),
            )),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _controller.uploadDocuments,
              child: const Text('Upload Documents'),
            ),
          ],
        ),
      ),
    );
  }
}