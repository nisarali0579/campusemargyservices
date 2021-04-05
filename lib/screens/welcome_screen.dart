import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:campus_emargency_project_ui/screens/login_home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WellComeScreen extends StatefulWidget {
  static String id = 'WellComeScreen';

  @override
  _WellComeScreenState createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen>with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 10), vsync: this);
    animation = ColorTween(begin: Colors.lightGreenAccent, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  final List<String> imgList = [
    'images/pic_1.jpg',
    'images/pic_3.jpg',
    // ' images/pic_4.jpg',
    // '/images/pic_5.jpg',
    // '/images/pic_6.jpg',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Container(
                //  padding: EdgeInsets.only(top: 17.0, left: 137, right: 154, bottom: 775),
                child: Image.asset(
                  'images/logo.png',
                  height: 134,
                  width: 137,
                ),
              ),
            ),
            Container(
              decoration: kBoxDecoration(),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
                items: imgList
                    .map(
                      (item) => Container(
                        child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, )),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 100),
              child: Container(
                height: 180,
                child: ColorizeAnimatedTextKit(
                  speed: Duration(milliseconds: 50),
                  repeatForever: true,
                  textDirection: TextDirection.rtl,
                  text: [
                    '                           Welcome',
                    '                                    To',
                    'Campus       Emargency            Services',
                  ],
                  textStyle: TextStyle(fontSize: 50.0, fontFamily: "Signatra"),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            doneBotton(context),
            // Center(
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.pushNamed(context, loginHome.id);
            //     },
            //     child: Padding(
            //       padding: const EdgeInsets.only(top: 100),
            //       child: Container(
            //         decoration: kBoxDecoration(),
            //         child: Padding(
            //           padding: const EdgeInsets.all(20),
            //           child: Text("WelCome Screen",style: TextStyle(fontFamily: 'Signatra'),),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

BoxDecoration kBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}
Widget doneBotton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50),
    child: Material(  //Wrap with Material
      //  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
      elevation: 18.0,
      color: Color(0xFF801E48),
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 200.0,
        height: 35,
        color: Color(0xFF801E48),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:40),
              child: new Text('WelCome',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white,)),
            ),
            SizedBox(width: 20,),  Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 25,)
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, loginHome.id);
        },
      ),
    ),
  );
}
