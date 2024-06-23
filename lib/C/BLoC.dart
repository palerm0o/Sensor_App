import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/C/states.dart';
import 'package:untitled10/M/sensors_model.dart';
import 'package:untitled10/M/user_model.dart';
import 'package:untitled10/V/secondscreen.dart';

class BLoC extends Cubit<MainState> {
  BLoC() : super(InitState());

  static BLoC get(context) => BlocProvider.of(context);
  SensorData? sensorData  ;

  Future login(UserModel user, context) async {
    showDialog(context: context, builder: (context)=>const AlertDialog(
      backgroundColor:Colors.transparent,
      content:SizedBox(height:100,width:100,child: Center(child: CircularProgressIndicator())) ,
      ));
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password);
      emit(LoginSucState());
      await fetchData();
      Navigator.pushNamedAndRemoveUntil(context,SecondScreen.id, (_)=>false);

    } on FirebaseAuthException catch (e) {
      emit(LoginFailState());
      if (kDebugMode) {
        print(e.code);
      }
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('Email Or Password Is Wrong');
        }
      } else {
        if (kDebugMode) {
          print('Authentication Failed: ${e.message}');
        }
      }
    } on SocketException catch (_) {
      emit(LoginFailState());
      if (kDebugMode) {
        print('No Internet Connection');
      }
    } catch (e) {
      emit(LoginFailState());
      if (kDebugMode) {
        print('An unexpected error occurred: $e');
      }
    }
  }

  Future<void> fetchData() async {
    print("object");
    DatabaseReference ref = FirebaseDatabase.instance.ref().child('Home');

    ref.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        try {
          sensorData = SensorData.fromJson(data);
          emit(FetchDataSucState());
          if (kDebugMode) {
            print('Sensor data: $sensorData');
          }
                } catch (e) {
          emit(FetchDataErrorState());
          if (kDebugMode) {
            print('Error parsing sensor data: $e');
          }
        }
      } else {
        emit(FetchDataSucState());
        if (kDebugMode) {
          print('No data available.');
        }
      }
    });
  }
}
