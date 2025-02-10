import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/MainControllers/cart_controllers.dart';
import '../../../CustomWidgets/custom_elevated_button.dart';
import '../../../CustomWidgets/custom_text_widget.dart';
import '../../../Utils/app_colors.dart';
class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const CustomTextWidget(
          text: "My Cart",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  var flight = cartController.cartItems[index];
                  return _buildCartItem(flight);
                },
              ),
            ),
          ),
          _buildCheckoutSection(),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, String> flight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(flight["flightLogo"]!, width: 50, height: 50),
                const SizedBox(width: 10),
                CustomTextWidget(
                  text: flight["flightName"]!,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
                const Spacer(),
                CustomTextWidget(
                  text: flight["price"]!,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFlightDetail("From", flight["departure"]!),
                const Icon(Icons.flight_takeoff, color: AppColors.primaryDark),
                _buildFlightDetail("To", flight["destination"]!),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFlightDetail("Date", flight["date"]!),
                CustomElevatedButton(
                  text: "Remove",
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    cartController.cartItems.remove(flight);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
        CustomTextWidget(
          text: value,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextWidget(
                text: "Total:",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              Obx(() {
                double total = cartController.cartItems.fold(
                    0, (sum, item) => sum + double.parse(item["price"]!.substring(1)));
                return CustomTextWidget(
                  text: "\$${total.toStringAsFixed(2)}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
            text: "Checkout",
            backgroundColor: AppColors.accent,
            textColor: AppColors.background,
            onPressed: () {
              Get.snackbar("Checkout", "Your flight tickets have been booked!",
                  backgroundColor: Colors.green, colorText: Colors.white);
            },
          ),
        ],
      ),
    );
  }
}
