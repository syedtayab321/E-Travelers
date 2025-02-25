import 'package:e_traverlers/Screens/BlogScreens/all_blog_screen.dart';
import 'package:get/get.dart';

class TopNavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final List pages = [
       AllBlogScreen(blogType: 'All Blogs',),
       AllBlogScreen(blogType: 'Technology',),
       AllBlogScreen(blogType: 'Health & Wellness',),
       AllBlogScreen(blogType: 'Finance',),
       AllBlogScreen(blogType: 'LifeStyle',),
       AllBlogScreen(blogType: 'Travel',),
       AllBlogScreen(blogType: 'Education',),
       AllBlogScreen(blogType: 'Food',),
       AllBlogScreen(blogType: 'Business',),
       AllBlogScreen(blogType: 'Entertainment',),
       AllBlogScreen(blogType: 'Science',),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
