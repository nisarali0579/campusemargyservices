import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Function onPressed;
  final String name;
  final Icon icon;
  Cards({ this.onPressed, this.name,  this.icon});


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 110,
        width: 100,
        color: Colors.white,
        child: Material(
          elevation: 5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              IconButton(icon: icon,onPressed: onPressed,),

                 Text(name, textAlign: TextAlign.center,style:TextStyle(color: Colors.black,),),

            ],
          ),
        ),
      ),
    );
  }
}