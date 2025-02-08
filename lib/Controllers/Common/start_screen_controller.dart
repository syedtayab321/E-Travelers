import 'package:get/get.dart';

class ScreenController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> screenData = [
    {
      "headline": "Your travel has just begun",
      "description": "A simple explanation to the audience regarding the headline",
      "image": "assets/images/background1.png",
    },
    {
      "headline": "Explore the hidden gems",
      "description": "Discover amazing places you've never seen before",
      "image": "assets/images/background2.png",
    },
    {
      "headline": "Adventure awaits",
      "description": "Embark on a journey full of excitement and thrill",
      "image": "assets/images/background3.png",
    },
  ];

  void nextScreen() {
    if (currentIndex < screenData.length - 1) {
      currentIndex++;
    }
  }

  void previousScreen() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }
}