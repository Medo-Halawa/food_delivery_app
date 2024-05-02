import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,  this.onTap,required this.text}) ;

  String? text;
  void Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color:kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height:60,
        width: double.infinity,
        child: Center(child: Text(text!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),)),
      ),
    );
  }
}