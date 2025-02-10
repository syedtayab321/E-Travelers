import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  var searchText = "".obs;
  var selectedCategory = "".obs;
  var minPrice = 0.0.obs;
  var maxPrice = 1000.0.obs;
  var minRating = 0.0.obs;

  List<String> categories = ["Adventure", "Beach", "City", "Mountains", "Desert"];

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void setPriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
  }

  void setRating(double rating) {
    minRating.value = rating;
  }
}
