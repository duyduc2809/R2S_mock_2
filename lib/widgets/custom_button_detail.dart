// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButtonDetail extends StatefulWidget {
  String? text;
  
  CustomButtonDetail({Key? key, this.text = ""});

  @override
  State<CustomButtonDetail> createState() => _CustomButtonDetailState();
}

class _CustomButtonDetailState extends State<CustomButtonDetail> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          click = !click;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10,bottom: 5,top: 5),
        child: Container(
          width: 64,
          height: 31,
          decoration: BoxDecoration(
            border: Border.all(
              color: click == true ? Color(0xFF878593) : Colors.green, width: 1.0,),
          ),
          child: Center(
            child: Text(widget.text!,
            style: TextStyle(
              color:click == true ? Color(0xFF878593) : Colors.green 
            ),),
          ),
        ),
      ),
    );
  }
}
