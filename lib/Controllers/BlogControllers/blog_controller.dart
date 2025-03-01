import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Modals/blogs_modal.dart';

class BlogController extends GetxController {
  RxList<BlogModel> blogs = <BlogModel>[].obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchBlogs();
    super.onInit();
  }

  // Fetch Blogs from Firebase
  Future<void> fetchBlogs() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('blogs').get();

      blogs.value = snapshot.docs.map((doc) {
        return BlogModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Failed to fetch blogs: $e");
    }
  }
}
