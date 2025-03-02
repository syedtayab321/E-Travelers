import 'package:e_traverlers/Utils/CustomSnakbars.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> processPayment({
    required String cardNumber,
    required String expiryDate,
    required String cvc,
  }) async {
    try {
      isLoading.value = true;
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: const PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              // Add billing details if needed
            ),
          ),
        ),
      );
      final response = await _createPaymentIntent(paymentMethod.id);

      if (response['status'] == 'succeeded') {
       showSuccessSnackbar('Success', 'Payment Successful!');
        Get.back();
      } else {
        showErrorSnackbar('Error', 'Payment Failed: ${response['error']}');
      }
    } catch (e) {
      showErrorSnackbar('Error', 'Payment Failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(String paymentMethodId) async {
    await Future.delayed(const Duration(seconds: 2));
    return {'status': 'succeeded'};
  }
}