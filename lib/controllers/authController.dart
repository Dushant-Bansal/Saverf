// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../styles/snack_bar.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class AuthController {
  static Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          await auth.signInWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            showSnackBar('Account exists with different credentials');
          } else if (e.code == 'invalid-credential') {
            showSnackBar('Invalid Credentials');
          }
        } catch (e) {
          showSnackBar('Error occured. Try Again.');
        }
      }
    } catch (_) {}
  }

  static Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await auth.signOut();
    } catch (_) {}
  }

  static isUserSignedIn() {
    return auth.currentUser == null ? false : true;
  }
}
