import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:vibration/vibration.dart';
import 'login_screen.dart';
  final databaseRef = FirebaseDatabase.instance.ref(); //database reference object

class buttonsView extends StatelessWidget {
   const buttonsView({super.key, required this.path});
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
      FutureBuilder(
      
              builder: (ctx, AsyncSnapshot snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
      
                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    return ListView.builder(
                       shrinkWrap: true,
                      itemCount: snapshot.data?.length,

                      itemBuilder: (context, index) {
                        if(snapshot.data[index] != null) {
                          return GestureDetector(
                          onDoubleTap: () async {
                             path.child(snapshot.data[index].toString()).once().then((event) async {
                              if(event.snapshot.value != null){
                              await path.update({snapshot.data[index].toString() : int.parse(event.snapshot.value.toString())+1 } ).then(
                                // ignore: avoid_print
                                (value)  {
                      Vibration.vibrate();
                                    FlutterBeep.beep();

                                  
                                  }).onError((error, stackTrace) {} );
                              }
                              else
                              {
                                path.update({snapshot.data[index].toString() : 1});
                      Vibration.vibrate();
                                    FlutterBeep.beep();
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Card(
                              
                              child: Center(child: Text(
                                
                                snapshot.data[index].toString()
                                ,style: const TextStyle(fontSize: 25) ,))),
                          ),
                        );
                        } else {
                          return const SizedBox(height: 3,);
                        }
                      },
                    );
                  }
                }
      
                // Displaying LoadingSpinner to indicate waiting state
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
      
              // Future that needs to be resolved
              // inorder to display something on the Canvas
              future: _fetchListItems(),
            
            ),
        ],
      )
    );
  }


  _fetchListItems() async {  
    var data;

await databaseRef.child("all").once().then((event) {
  final dataSnapshot = event.snapshot;
  data = event.snapshot.value;
  if (dataSnapshot.value != null) {
    return event.snapshot.value;
  }
});

    return data;
  }
}


