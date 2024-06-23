import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/C/BLoC.dart';
import 'package:untitled10/C/states.dart';
import 'package:untitled10/M/user_model.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  static String id = 'FirstScreen';
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 69, 122),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/pic6.jpg'), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // icon hazard alarm /-------------------------------------
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/logo3.jpg"),
                    ),
                  ),
                  // TEXT HAZRD ALARM SYSTEM //-------------------------------
                  const Text(
                    'Hazard Alarm System',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 100),
                  // USER NAME // ---------------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: TextFormField(
                        validator: (val) {
                          const pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
                          final regExp = RegExp(pattern);

                          if (val!.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!regExp.hasMatch(val)) {
                            return 'Invalid email format';
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'username',
                          prefixIconColor: Colors.white38,
                          prefixIcon: const Icon(Icons.person),
                          hintText: ('Enter Username'),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 207, 199, 187)),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // PASSWORD //--------------------------------------------------------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (val.length < 6) {
                            return 'Password must have at least 6 characters';
                          }
                        },
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIconColor: Colors.white38,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: ('Enter Password'),
                          hintStyle: const TextStyle(color: Colors.white),
                          labelStyle: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 207, 199, 187)),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  //------------- LOGIN //-------------------------//
                  BlocConsumer<BLoC, MainState>(listener: (context, state) async {
                    if (state is LoginFailState) {
                      Navigator.pop(context);
                     await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Mail Or Password Is Wrong '),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }, builder: (context, state) {
                    return MaterialButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 50,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await BLoC.get(context).login(UserModel(emailController.text, passController.text), context);
                        }
                      },
                      child: const Text('Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    );
                  }),
                  const SizedBox(height: 40),

                  //------SIGN UP //----------------------------------
/*
                  MaterialButton(
                    color: Colors.orange,
                    textColor: Colors.white,
                    minWidth: 100,
                    height: 50,
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
*/
                  const SizedBox(height: 90)
                ],
              )),
        ),
      ),
    );
  }
}
