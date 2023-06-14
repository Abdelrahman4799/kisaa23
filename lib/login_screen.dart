import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:kisaa23/fireAuth.dart';
import 'package:kisaa23/superAdmin.dart';
import 'package:kisaa23/trackScreen.dart';

import 'Component.dart';

import 'package:flutter/material.dart';


import 'Toast.dart';
import 'mainScreen.dart';
class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool loading = false;
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final databaseRef = FirebaseDatabase.instance.ref(); //database reference object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                  color: bcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "❤️ الكساء  ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.4,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     return 'Enter Email';
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailcon,
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                      )),
                                  TextFormField(
                                    obscureText: true,
                                                                        keyboardType: TextInputType.number,
                                    controller: passwordcon,
                                    
                                    decoration: const InputDecoration(
                                      hintText: "Password",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            
                            const SizedBox(
                              height: 55,
                            ),
                            roundbutton(
                                title: "Login",
                                tapfun: () async {
                                 User? user = await FireAuth.signInUsingEmailPassword(email: emailcon.text, 
                                 password: passwordcon.text );
                                 if (kDebugMode) {
                                   print(user);
                                 }
                                  if (user != null) {
                                    if (user.uid ==
                                        "bJxzTnt8V3bWZW0gaRBh616Ia2r1") {
                                      if (kDebugMode) {
                                        print("super");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        const superAdmin()));
                                      }

                                    } else if (user.uid ==
                                        "LyG08h6PymaugCYAEIUchtcnFZ93") {
                                      if (kDebugMode) {
                                        print("enter-gates");
                                      }

                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        buttonsView(
                                                            path: databaseRef
                                                                .child(
                                                                    "enter"))));
                                      }
                                    } else if (user.uid ==
                                        "TigVmngmkNarYmfkayHw06u2IL63") {
                                      if (kDebugMode) {
                                        print("exit-gates");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        buttonsView(
                                                            path: databaseRef
                                                                .child(
                                                                    "exit"))));
                                      }
                                    } else if (user.uid ==
                                        "05SwmlDBkJP4KX1rBsUnMN1cqJm1") {
                                      if (kDebugMode) {
                                        print("1");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track1").child("enter"))));
                                      }
                                    } else if (user.uid ==
                                        "efnEQZvydWRimh9SXppGuPHm7ZJ2") {
                                      if (kDebugMode) {
                                        print("2");
                                      }
                                       if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track2").child("enter"))));
                                      }
                                    } else if (user.uid ==
                                        "Es2GgRMYIYM1NDaBz1pZwM3wCLK2") {
                                      if (kDebugMode) {
                                        print("3");
                                      }
                                       if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track3").child("enter"))));
                                      }
                                    } else if (user.uid ==
                                        "EGoyvA6ew1VMyCRl7fUhF6AGnFr2") {
                                      if (kDebugMode) {
                                        print("4");
                                      }
                                       if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track4").child("enter"))));
                                      }
                                    }

                                      //exit
                                  else if (user.uid ==
                                        "5fh1cKIWgGP286VImQ52iDlF8Cv1") {
                                      if (kDebugMode) {
                                        print("1-exit");
                                      }
                                       if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track1").child("exit"))));
                                      }
                                    } else if (user.uid ==
                                        "PlZv1uU2gJQEOjwPCdZQx1oAOzm1") {
                                      if (kDebugMode) {
                                        print("2-exit");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track2").child("exit"))));
                                      }
                                    } else if (user.uid ==
                                        "mu5DmOahnzOSllKsOuZZohmxMAR2") {
                                      if (kDebugMode) {
                                        print("3-exit");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track3").child("exit"))));
                                      }
                                    } else if (user.uid ==
                                        "IPKAFAEvxLRHoJGjh3h7oy2TQnC3") {
                                      if (kDebugMode) {
                                        print("4-exit");
                                      }
                                      if (context.mounted) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        TrackScreen(
                                                            path: databaseRef
                                                                .child(
                                                                    "track4").child("exit"))));
                                      }
                                    }

                                  } else {
                                    toastmessage("البيانات غلط");
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                         
                            const SizedBox(
                              height: 10,
                            ),
                            
                          ],
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
    );
  }
}