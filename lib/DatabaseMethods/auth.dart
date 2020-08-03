import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// final GoogleSignIn googleSignIn = GoogleSignIn();

// login() async {

//   GoogleSignInAccount user = await googleSignIn.signIn();
//   if (user != null) {
//     print("loginn succes");
//     return true;
//   } else {
//     print("loginn fail");
//     return false;
//   }
// }

// logout() {
//   googleSignIn.signOut();
// }

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print(user.displayName);
  print(user.email);
  print(user.photoUrl);

  // return 'signInWithGoogle succeeded: $user';
  return true;
}

signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

// after() {
//   // Add these three variables to store the info
// // retrieved from the FirebaseUser
//   String name;
//   String email;
//   String imageUrl;

// // Add the following lines of code inside the
// // signInWithGoogle method
//   final AuthResult user = await _auth.signInWithCredential(credential);

// // Add the following lines after getting the user
// // Checking if email and name is null
//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoUrl;

// // Only taking the first part of the name, i.e., First Name
//   if (name.contains(" ")) {
//     name = name.substring(0, name.indexOf(" "));
//   }
// }
