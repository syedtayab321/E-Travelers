import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_traverlers/Screens/Auth/login_screen.dart';
import 'package:e_traverlers/Utils/CustomSnakbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<void> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String phone,
    required String nationality,
    required String gender,
    required String cnic,
    required String passport,
    required DateTime dob,
  }) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
      // 1. Create User in Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2. Get the User UID
      String uid = userCredential.user!.uid;

      // 3. Store User Data in Firestore
      await firestore.collection("users").doc(uid).set({
        "uid": uid,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "nationality": nationality,
        "gender": gender,
        "cnic": cnic,
        "passport": passport,
        "dob": dob.toIso8601String(),
        "role": "user", // Assign default role
        "createdAt": FieldValue.serverTimestamp(),
      });
      showSuccessSnackbar("Success", "User registered successfully");
      Get.offAll(LoginScreen());
  } catch (e) {
      showErrorSnackbar('Error', 'User registration failed');
    }
  }
