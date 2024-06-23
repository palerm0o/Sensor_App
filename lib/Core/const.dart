import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> initCloud() {
  return Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBNlaOWFGN3c-hqvz3IxlSj-ufcPihaU8Y',
          appId: '1:227566740096:android:3fb6213c6bc9dfaf54bc65',
          messagingSenderId: '227566740096',
          projectId: 'mata-da88e',
          databaseURL: 'https://mata-da88e-default-rtdb.firebaseio.com'));
}

Function(String?)? mailValidator = (val) {
  final pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
  final regExp = RegExp(pattern);

  if (val!.isEmpty) {
    return 'Email cannot be empty';
  } else if (!regExp.hasMatch(val)) {
    return 'Invalid email format';
  }
};
Function(String?)? passValidator = (val) {
  if (val!.isEmpty) {
    return 'Password cannot be empty';
  } else if (val.length < 6) {
    return 'Password must have at least 6 characters';
  }
};
