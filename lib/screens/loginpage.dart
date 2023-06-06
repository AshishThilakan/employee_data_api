
import 'package:flutter/material.dart';

import 'get_details_screen.dart';
import 'get_employee_details_screen.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State {
  var formkey = GlobalKey<FormState>();
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        hintText: 'UserName',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                    textInputAction: TextInputAction.next,
                    validator: (uname) {
                      if (uname!.isEmpty || !uname.contains('@')) {
                        return 'Enter a valid UserName';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    obscureText: showpass,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (showpass) {
                                showpass = false;
                              } else {
                                showpass = true;
                              }
                            });
                          },
                          icon: Icon(showpass == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                    textInputAction: TextInputAction.done,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return 'Enter a valid password , length  should be greater than 6';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                    onPressed: () {
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  GetEployeeDetailsScreen()));
                      } else {
                        return null;
                      }
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

