import 'package:get/get.dart';

class ReviewController extends GetxController {
  var reviews = <String>[].obs;
  var reviewText = "".obs;

  void addReview() {
    if (reviewText.value.isNotEmpty) {
      reviews.add(reviewText.value);
      reviewText.value = ""; // Clear input after adding
    }
  }
}