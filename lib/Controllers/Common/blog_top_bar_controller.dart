import 'package:e_traverlers/Screens/BlogScreens/BlogTopBarScreens/all_blog_screen.dart';
import 'package:get/get.dart';

class TopNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final List pages = [
       AllBlogScreen(),
       AllBlogScreen(),
       AllBlogScreen(),
       AllBlogScreen(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
