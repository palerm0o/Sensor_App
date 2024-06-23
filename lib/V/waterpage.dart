import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/C/BLoC.dart';
import 'package:untitled10/C/states.dart';

class WaterPage extends StatelessWidget {
  const WaterPage({super.key});
  static String id = 'WaterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar//---------------------------------------------------------------
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 4, 69, 122),
        title: const Text(
          'Water Test',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      //------------------------------------------------------------------//
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/1.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 170),
          child: Center(
            child: Column(
              children: [
                // BUTTON ADD PEICE//-----------------------------------------

                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      // TEXT WATER TEST//------------------------------------
                      const Text(
                        'Water Test',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(12)),
                            child: BlocConsumer<BLoC,MainState>(
                              listener: (context, state){},
                              builder:  (context, state){
                                return TextField(
                                decoration: InputDecoration(
                                  labelText: BLoC.get(context).sensorData!.watersensor.serstat.toString(),
                                  enabled: false,
                                  labelStyle: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 23,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 207, 199, 187)),
                                  ),
                                ),
                                style: const TextStyle(color: Colors.white),
                              );},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
