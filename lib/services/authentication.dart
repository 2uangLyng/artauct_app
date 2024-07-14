import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  // for storign data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // for authencation
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //with google
  Future<UserCredential?> loginWithGoogle() async {
    try {
      UserCredential? userCredential;
      // Trigger the Google Sign In process
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // Obtain the GoogleSignInAuthentication object
        final googleAuth = await googleUser.authentication;
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Sign in to Firebase with the Google [UserCredential]
        userCredential = await _auth.signInWithCredential(credential);

        // Check if user is already in Firestore
        if (userCredential.user != null) {
          DocumentSnapshot userDoc = await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();
          if (!userDoc.exists) {
            // If not, add user data to Firestore
            await _firestore
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
              'name': userCredential.user!.displayName,
              'email': userCredential.user!.email,
              'uid': userCredential.user!.uid,
            });
          }
        }
      }
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // for sign up
  Future<String> signUpUser(
      {required String email,
      required String name,
      required String password}) async {
    String res = "Some error Occurred";
    try {
      if (email.isEmpty || name.isEmpty || password.isEmpty) {
        res = "Please fill all the fields";
        return res;
      }
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await userCredential.user!.updateProfile(displayName: name);
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': userCredential.user!.uid,
        });
        res = "Successfully";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error Occurred";
    try {
      if (email.isEmpty || password.isEmpty) {
        res = "Please fill all the fields";
        return res;
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      res = "Successfully";
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> sendPasswordResetEmail({required String email}) async {
    String res = "Some error Occurred";
    try {
      if (email.isEmpty) {
        res = "Please fill all the fields";
        return res;
      }
      await _auth.sendPasswordResetEmail(email: email);
      res = "Password reset email sent successfully";
    } catch (e) {
      print('Failed to send password reset email: $e');
      res = e.toString();
    }
    return res;
  }
}
