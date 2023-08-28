// ignore_for_file: unused_element, non_constant_identifier_names, unused_field, unnecessary_null_comparison, empty_catches, avoid_print, unused_local_variable, body_might_complete_normally_nullable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Auth Models/auth_class.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users? _FromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users?> get UserDetails {
    return _auth.authStateChanges().map(_FromFirebaseUser);
  }

  // Future RegisterTHroughEmail(String Email, String Password) async {
  //   try {
  //     UserCredential Result = await _auth.createUserWithEmailAndPassword(
  //         email: Email, password: Password);
  //     User? users = Result.user;

  //     return _FromFirebaseUser(users);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // Future LogInThroughEmail(String Email, String Password) async {
  //   try {
  //     UserCredential Result = await _auth.signInWithEmailAndPassword(
  //         email: Email, password: Password);
  //     User? users = Result.user;

  //     return _FromFirebaseUser(users);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // Future LogOut() async {
  //   try {
  //     return await _auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
