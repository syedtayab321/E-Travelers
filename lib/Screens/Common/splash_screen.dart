import 'package:e_traverlers/CustomWidgets/custom_text_widget.dart';
import 'package:e_traverlers/Screens/Common/start_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Get.off(StartScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF003366),
                  Color(0xFF1E90FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                const CustomTextWidget(
                 text:  "E-Travelers",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                 text:"Explore the world with ease",
                    fontSize: 16,
                    color: Colors.white70,
                ),
                const Spacer(),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
