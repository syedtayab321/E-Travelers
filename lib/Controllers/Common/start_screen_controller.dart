import 'package:get/get.dart';

class ScreenController extends GetxController {
  var currentIndex = 0.obs;

  final List<Map<String, String>> screenData = [
    {
      "headline": "Your travel has just begun",
      "description": "A simple explanation to the audience regarding the headline",
      "image": "assets/images/background1.jpg",
    },
    {
      "headline": "Explore the hidden gems",
      "description": "Discover amazing places you've never seen before",
      "image": "assets/images/background2.jpg",
    },
    {
      "headline": "Adventure awaits",
      "description": "Embark on a journey full of excitement and thrill",
      "image": "assets/images/background3.jpg",
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