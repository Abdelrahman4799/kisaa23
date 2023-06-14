// ignore_for_file: file_names, camel_case_types

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'Component.dart';
import 'login_screen.dart';
  final databaseRef = FirebaseDatabase.instance.ref(); //database reference object
TextEditingController  textFieldController = TextEditingController();
bool auth = false;
class superAdmin extends StatelessWidget {
  const superAdmin({super.key});

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

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25 ),
              child: roundbutton(
                title: "بوابات",
                tapfun: () async {
                   int totalent=0,totalex=0;
                  await databaseRef.child("enter").once().then((event){
                    for (final i in event.snapshot.children)
                    {
                      totalent += int.parse(i.value.toString());
                    }
                  } );

                   await databaseRef.child("exit").once().then((event){
                    for (final i in event.snapshot.children)
                    {
                      totalex += int.parse(i.value.toString());
                    }
                  } );

                  mydiag(context,'اجمالي الدخول:  ${totalent.toString()}'+'\n' + 'اجمالي الخروج:  ${totalex.toString()}'+
                  '\n'+ 'داخل الكساء: ${ (totalent - totalex).toString() }').show();
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25 ),
              child: roundbutton(
                title: "جمعيات",
                tapfun: () async {
                   String enter ='',exit='';
                  await databaseRef.child("enter").once().then((event){
                    enter  =  event.snapshot.value.toString();
                  } );

                   await databaseRef.child("exit").once().then((event){
                    exit = event.snapshot.value.toString();
                  } );

                  mydiag(context,'الدخول: \n  $enter''\n \n \n' 'الخروج \n ${exit}').show();
                },
              ),
            ),

Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25 ),
              child: roundbutton(
                title: "تراكات",
                tapfun: () async {
                   int ent1=0,ent2=0,ent3=0,ent4=0,exi1=0,exi2=0,exi3=0,exi4=0,totalent=0;
                  await databaseRef.child("track1").child("enter").child("count").once().then((event){
                   
                      event.snapshot.value!=null?ent1=int.parse(event.snapshot.value.toString()):ent1=0;
                        
                      
                  } );

                   await databaseRef.child("track1").child("exit").child("count").once().then((event){
                    
                      event.snapshot.value!=null?exi1=int.parse(event.snapshot.value.toString()):exi1=0;
                    
                  } );
                  await databaseRef.child("track2").child("enter").child("count").once().then((event){
                   
                      event.snapshot.value!=null?ent2=int.parse(event.snapshot.value.toString()):ent2=0;
                    
                  } );

                   await databaseRef.child("track2").child("exit").child("count").once().then((event){
                   
                      event.snapshot.value!=null?exi2=int.parse(event.snapshot.value.toString()):exi2=0;
                    
                  } );

                  await databaseRef.child("track3").child("enter").child("count").once().then((event){
                
                      event.snapshot.value!=null?ent3=int.parse(event.snapshot.value.toString()):ent3=0;
                    
                  } );

                   await databaseRef.child("track3").child("exit").child("count").once().then((event){
                      event.snapshot.value!=null?exi3=int.parse(event.snapshot.value.toString()):exi3=0;
                  } );

                  await databaseRef.child("track4").child("enter").child("count").once().then((event){
                 
                      event.snapshot.value!=null?ent4=int.parse(event.snapshot.value.toString()):ent4=0;
                    
                  } );

                   await databaseRef.child("track4").child("exit").child("count").once().then((event){
                
                      event.snapshot.value!=null?exi4=int.parse(event.snapshot.value.toString()):exi4=0;
                    
                  } );


                  await databaseRef.child("enter").once().then((event){
                    for (final i in event.snapshot.children)
                    {
                      totalent += int.parse(i.value.toString());
                    }
                  } );

                  mydiag(context,
                  'تراك 1 \n'+
                  'دخول: ${ent1.toString()}       خروج: ${exi1.toString()}      بالداخل: ${(ent1-exi1).toString()}' + '\n \n'+
                  
                   'تراك 2 \n'+
                  'دخول: ${ent2.toString()}       خروج: ${exi2.toString()}      بالداخل: ${(ent2-exi2).toString()}' + '\n \n'+

                   'تراك 3 \n'+
                  'دخول: ${ent3.toString()}       خروج: ${exi3.toString()}      بالداخل: ${(ent3-exi3).toString()}' + '\n \n'+

                   'تراك 4 \n'+
                  'دخول: ${ent4.toString()}       خروج: ${exi4.toString()}      بالداخل: ${(ent4-exi4).toString()}' + '\n \n'+

                   ' اجمالي التراكات\n'+
                  'دخول تراكات: ${(ent1+ent2+ent3+ent4).toString()}        خروج تراكات: ${(exi1+exi2+exi3+exi4).toString()}      بالداخل: ${((ent1+ent2+ent3+ent4)-(exi1+exi2+exi3+exi4)).toString()}'
                  +'\n \n'+
                  'ساحة انتظار \n ${(totalent-(ent1+ent2+ent3+ent4)).toString()}'
                  ).show();
                },
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical:25 ),
              child: roundbutton(
                title: "تصفير",
                tapfun: () async {

                 await displayTextInputDialog(context);
                  if(auth)
                  {
                    AwesomeDialog(
                      context: context,
                       dialogType: DialogType.warning,
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      width: 400,
                      buttonsBorderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                      dismissOnTouchOutside: true,
                      dismissOnBackKeyPress: false,
                     
                      headerAnimationLoop: true,
                      animType: AnimType.scale,
                      title: '!',
                      desc: "متأكد؟",
                      showCloseIcon: true,
                      btnOkOnPress: () async {
await databaseRef.child("enter").set({});
                  await databaseRef.child("exit").set({});
                  await databaseRef.child("track1").child("enter").set({});
                  await databaseRef.child("track1").child("exit").set({});
                  await databaseRef.child("track2").child("enter").set({});
                  await databaseRef.child("track2").child("exit").set({});
                  await databaseRef.child("track3").child("enter").set({});
                  await databaseRef.child("track3").child("exit").set({});
                  await databaseRef.child("track4").child("enter").set({});
                  await databaseRef.child("track4").child("exit").set({});


                      },
                      btnCancelOnPress: (){}
                    ).show();
                  auth = false;
                  }

                  else
                  {
                    AwesomeDialog(context: context, desc: "الباسوورد غلط").show();

                  }

                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}


AwesomeDialog mydiag(context, message)
{
  return AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                      width: 400,
                      buttonsBorderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                      dismissOnTouchOutside: true,
                      dismissOnBackKeyPress: false,
                     
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'INFO',
                      desc: message,
                      showCloseIcon: true,
                      btnOkOnPress: () {},
                    );
}


Future<void> displayTextInputDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('enter password'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "password"),
            obscureText: true,
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('OK'),
              onPressed: () {
                if(textFieldController.text == "farz23")
                {
                    auth = true;
                }
                else
                {
                    auth = false ; 
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}