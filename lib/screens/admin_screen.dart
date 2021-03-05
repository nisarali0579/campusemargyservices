
import 'package:flutter/material.dart';
import 'package:campus_emargency_project_ui/utils/utils.dart';

class adminScreen extends StatefulWidget {
  static String id = 'adminScreen';

  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0XFFF7F7F7),
          body: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Hi Admin',
                style: TextStyle(color: Color(0xffD0874C), fontSize: 20.0),
              ),
              Text(
                'Welcome Back',
                style: TextStyle(color: Colors.green, fontSize: 15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    child: Material(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                        child: SizedBox(
                          width: 350.0,
                          height: 100.0,
                          child: TextField(
                            style: TextStyle(fontSize: 20.0),
                            maxLines: 10,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter Your Text',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ),
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    child: Utils.smallButton('Send', () {}),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 120,
                        width: 100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: Container(
                        height: 120,
                        width: 100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: Container(
                        height: 120,
                        width: 100,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        height: 120,
                        width: 100,
                        color: Colors.white,
                        child: Material(
                          elevation: 5,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(icon: Icon(Icons.account_circle_rounded), onPressed: null),
                             Padding(
                               padding: const EdgeInsets.only(left: 20.0),
                               child: Text("student managed",style: TextStyle(color: Colors.black,),),
                             )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: Container(
                        height: 120, width: 100,
                        // color: Colors.white,
                        child: Material(
                          elevation: 5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}