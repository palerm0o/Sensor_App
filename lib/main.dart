import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/C/BLoC.dart';

import 'Core/const.dart';
import 'V/electricitypage.dart';
import 'V/firstscreen.dart';
import 'V/gaspage.dart';
import 'V/secondscreen.dart';
import 'V/waterpage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Firebase.apps.isEmpty) {
      await initCloud();
    }
    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> BLoC()..fetchData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          FirstScreen.id: (context) => FirstScreen(),
          SecondScreen.id: (context) => const SecondScreen(),
          WaterPage.id: (context) => const WaterPage(),
          GasPage.id: (context) => const GasPage(),
          ElectricityPage.id: (context) => const ElectricityPage(),
        },
        initialRoute: FirstScreen.id,
      ),
    );
  }
}
