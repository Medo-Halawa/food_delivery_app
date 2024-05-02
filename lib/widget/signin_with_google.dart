import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Color(0xffF0F5FA),),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF0F5FA),
      ),
      width:double.infinity,
      height:60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(

              child:
              Image.asset(
                  width: 50,
                  height: 50,
                  'assets/google.png',
                  fit:BoxFit.cover
              )
          ),
          const SizedBox(width: 30,),
          const Text('Sign-in with Google', style: TextStyle(
            fontSize: 16,
            color:Color(0xff051934),
          ),

          )
        ],
      ),
    );
  }
}