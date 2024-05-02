import 'package:flutter/material.dart';

import '../constant.dart';

class CustomFormTextField extends StatelessWidget {

  CustomFormTextField({super.key ,required this.validator,required this.hintText,this.obscureText=false, required this.myController});
  String? hintText;
  //Function(String)? onChange ;
  bool? obscureText ;
  final TextEditingController myController  ;
  final String? Function(String?)? validator ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      obscureText:obscureText!,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor:const Color(0xffF0F5FA) ,
        hintText: hintText,
        hintStyle:const  TextStyle(
          color:Colors.grey ,
        ),
        enabledBorder:const  OutlineInputBorder(
            borderRadius:BorderRadius.horizontal(
              left: Radius.circular(10),
              right: Radius.circular(10),
            ),
            borderSide: BorderSide(
              color:Color(0xffF0F5FA),

            )
        ),
        border:const OutlineInputBorder(
            borderSide: BorderSide(
              color:Colors.white12,
            )
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.grey,
          ),
        ),
      ),
    );
  }
}