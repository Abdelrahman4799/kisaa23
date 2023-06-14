import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:kisaa23/login_screen.dart';
import 'package:vibration/vibration.dart';

class TrackScreen extends StatelessWidget {
   const TrackScreen({super.key, required this.path});
 final DatabaseReference  path;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("الكساء"),
      actions: [Padding(
        padding: const EdgeInsets.only(right:20.0),
        child: GestureDetector(
          onTap: () {
            if (context.mounted) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                         const loginscreen() ));
                                        }
          },
          child: const Icon(Icons.logout_rounded, color: Colors.black,),
        ),
      )],
      ),

      body: Column(
        children: [
           GestureDetector(
            child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Card(
                              
                              child: Center(child: Text(
                                "+"
                                ,style: TextStyle(fontSize: 100) ,))),

                                
                          ),
                          onDoubleTap: () async {
                             path.child("count").once().then((event) async {
                              if(event.snapshot.value != null){
                              await path.update({"count" : int.parse(event.snapshot.value.toString())+1 } ).then(
                                // ignore: avoid_print
                                (value)  {
                      Vibration.vibrate();
                                    FlutterBeep.beep();

                                  
                                  }).onError((error, stackTrace) {} );
                              }
                              else
                              {
                                path.update({"count" : 1});
                      Vibration.vibrate();
                                    FlutterBeep.beep();
                              }
                            });
                          },
           )
        ],
      ),
    );
  }
}