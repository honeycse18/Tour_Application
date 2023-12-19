import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_app/ui/route/routes.dart';

class Auth {
  final box = GetStorage();

  Future registration(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Registration Successfull');
        box.write('uid', authCredential.uid);
        Get.toNamed(userform);
      } else {
        print("Sign Up Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'This account already exists for that email');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }

  Future login(String emailAddress, String password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      var authCredential = userCredential.user;
      print(authCredential);

      if (authCredential!.uid.isNotEmpty) {
        Fluttertoast.showToast(msg: 'Sign In Successfull');
        Get.toNamed(homepage);
      } else {
        print("Sign In Failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'This account already exists for that email');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error is: $e');
    }
  }
}
