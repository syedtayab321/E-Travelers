import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Common/start_screen_controller.dart';
import '../../Utils/app_colors.dart';

class StartScreen extends StatelessWidget {
  final ScreenController controller = Get.put(ScreenController());
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => Stack(
          fit: StackFit.expand,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                controller.screenData[controller.currentIndex.value]['image']!,
                key: ValueKey(controller.currentIndex.value),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: controller.screenData[controller.currentIndex.value]['headline']!,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  CustomTextWidget(
                    text: controller.screenData[controller.currentIndex.value]['description']!,
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed:(){
                          Get.offAll(LoginScreen());
                        },
                        child: const CustomTextWidget(
                          text: "Skip",
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          if (controller.currentIndex.value > 0)
                            ElevatedButton(
                              onPressed: controller.previousScreen,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                backgroundColor: AppColors.primary,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: (){
                              if(controller.currentIndex.value < 2){
                                  controller.nextScreen();
                                }else {
                                Get.offAll(LoginScreen());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              backgroundColor: AppColors.accent,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}