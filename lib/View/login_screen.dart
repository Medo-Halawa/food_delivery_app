import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halawa/widget/custom_button.dart';
import 'package:halawa/widget/custom_text_field.dart';
import '../constant.dart';
import '../widget/signin_with_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate =GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Halawa Delivery',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      backgroundColor: const Color(0xff051934),
      body: Column(
        children: [
          //Login
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Please Sign in to your Existing Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomFormTextField(
                          validator: (data) {
                            if(data!.isEmpty){
                              return 'Filed is Required';
                            }
                          },
                          myController:email,
                          hintText: 'Enter Email',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomFormTextField(
                          validator: (data) {
                            if(data!.isEmpty){
                              return 'Filed is Required';
                            }
                          },
                          myController:password,
                          hintText: 'Enter Password',
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                       CustomButton(
                           text:'Login',
                         onTap: () async{
                             if(formstate.currentState!.validate()){
                               try {
                                 final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                   email:email.text,
                                   password:password.text,
                                 );
                                 Navigator.of(context).pushNamed("HomePage");
                               } on FirebaseAuthException catch (e) {
                                 if (e.code == 'user-not-found') {
                                   print('No user found for that email.');
                                   // showSnackBar(context, 'worng-password');
                                   AwesomeDialog(
                                     context: context,
                                     dialogType: DialogType.error,
                                     animType: AnimType.rightSlide,
                                     title: 'user-not-found',
                                     desc: 'No user found for that email.',
                                   ).show();
                                 } else if (e.code == 'wrong-password') {
                                   print('Wrong password provided for that user.');
                                   AwesomeDialog(
                                     context: context,
                                     dialogType: DialogType.error,
                                     animType: AnimType.rightSlide,
                                     title: 'wrong-password',
                                     desc: 'Wrong password provided for that user.',
                                   ).show();
                                 }
                               }
                             }else{
                               print('Not Validate');
                             }
                         },

                       ),
                        const SizedBox(height: 24,),
                        //Sign-in with Google
                        const SignInWithGoogle(),
                        const SizedBox(
                          height: 16,
                        ),
                        const Center(
                            child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'don\'t have an account ?',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("RegisterScreen");
                              },
                              child: const Text(
                                '  Register',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff052344),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



