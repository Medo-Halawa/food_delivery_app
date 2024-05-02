import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String  id ="RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userName =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  GlobalKey<FormState> formstate =GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const  Color(0xff051934),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,

        title: const Text('Halawa Delivery',  style: TextStyle(
          fontSize: 24,
          fontFamily: 'Pacifico',
        ),),
      ),
      body: Column(
        children: [
          //Login
          const SizedBox(height: 60,),
          const Text('Register',
            textAlign: TextAlign.center,
            style:  TextStyle(
              color:Colors.white ,
              fontSize: 24,
              fontWeight: FontWeight.bold,

            ),),
          const SizedBox(height: 24,),
          const Text('Please Sign Up to get Started',
            textAlign: TextAlign.center,
            style:  TextStyle(
              color:Colors.white ,
              fontSize: 16,
              fontWeight: FontWeight.w300,

            ),),
          const SizedBox(height: 60,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight:Radius.circular(24),topLeft: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key:formstate,
                    child: Column(
                      children: [
                        const SizedBox(height: 24,),
                        const Text('Name',style: TextStyle(color: Colors.black ,fontSize: 16),),
                        const SizedBox(height: 10,),
                        CustomFormTextField(
                          validator: (data) {
                            if(data!.isEmpty){
                              return 'Filed is Required';
                            }
                          },
                          myController: userName,
                          hintText: 'Enter Name',
                        ),
                        const SizedBox(height: 24,),
                        const Text('Email',style: TextStyle(color: Colors.black ,fontSize: 16),),
                        const SizedBox(height: 10,),
                        CustomFormTextField(
                          validator: (data) {
                            if(data!.isEmpty){
                              return 'Filed is Required';
                            }
                          },
                          myController: email,
                          hintText: 'Enter Email',
                        ),
                        const SizedBox(height: 24,),
                        const Text('Password',style: TextStyle(color: Colors.black ,fontSize: 16),),
                        const SizedBox(height: 10,),
                        CustomFormTextField(
                          validator: (data) {
                            if(data!.isEmpty){
                              return 'Filed is Required';
                            }
                          },
                          myController: password,
                          hintText: 'Enter Password',
                          obscureText: true,
                        ),
                        const SizedBox(height: 24,),
                        CustomButton(

                          onTap: ()async{
                          if(formstate.currentState!.validate()){
                            try {
                              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacementNamed("HomePage");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'weak-password',
                                  desc: 'The password provided is too weak..',
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                print('The account already exists for that email.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'email-already-in-use',
                                  desc: 'The account already exists for that email.',
                                ).show();
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          },
                            text:'Register'
                        ),
                        const SizedBox(height: 24,),
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
