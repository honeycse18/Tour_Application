import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_app/ui/route/routes.dart';
import '../../route/routes.dart';

class User_Info {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  sendFromDataToDB(
      String name, int phone, String address, String dob, String gender) async {
    try {
      CollectionReference _course =
          FirebaseFirestore.instance.collection("user-form-data");
      _course.doc(_auth.currentUser!.email).set({
        'name': name,
        'phone': phone,
        'address': address,
        'dob': dob,
        'gender': gender,
      }).whenComplete(() {
        Fluttertoast.showToast(msg: "Added Successfully");
        Get.toNamed(privacypolicy);
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "error: $e");
    }
  }
}
