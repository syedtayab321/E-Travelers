import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import '../Controllers/Common/payment_controller.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({super.key});

  final PaymentController _paymentController = Get.put(PaymentController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomTextWidget(
                  text: 'Payment Details',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your card number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _expiryDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date (MM/YY)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the expiry date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _cvcController,
                  decoration: const InputDecoration(
                    labelText: 'CVC',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the CVC';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Obx to handle loading state
                Obx(() => _paymentController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _paymentController.processPayment(
                        cardNumber: _cardNumberController.text,
                        expiryDate: _expiryDateController.text,
                        cvc: _cvcController.text,
                      );
                    }
                  },
                  child: const CustomTextWidget(text: 'Pay Now'),
                ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: const CustomTextWidget(text: 'Cancel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}