import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebaseauth/screens/login.dart';
import 'package:firebaseauth/widgets/CommonButtons.dart';
import 'package:firebaseauth/widgets/TextFields.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var passController2 = TextEditingController();
  var phoneController = TextEditingController();
  final GlobalKey< FormState > _formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
              ),
              // buildNameField(),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child:Column(
                  children: [
                    CustomTextField(
                        title: 'Name',
                        inputType: TextInputType.name,
                        visible: false,
                        controller: nameController,
                        validator: (nameText)  {
                          if (nameText!.isEmpty){return "Enter name";}
                          else if(!RegExp(r"^[\p{L} ,.'-]*$",
                              caseSensitive: false, unicode: true, dotAll: true).hasMatch(nameText)){
                            return "Enter valid Name";}
                          return null;
                        }

                    ),

                    CustomTextField(
                      title: 'Email',
                      inputType: TextInputType.emailAddress,
                      visible: false,
                      controller: emailController,
                      validator: (val){
                        if (val!.isEmpty){
                          return "Fill out this field";}

                        else if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(val
                        )) {
                          return 'Please enter correct email';
                        }
                        return null;

                      },

                    ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // buildEmailField(),
                    CustomTextField(
                      title: 'Phone Number',
                      inputType: TextInputType.phone,
                      visible: false,
                      controller: phoneController,
                      validator: (phNo){
                        if(phNo!.isEmpty){
                          return "Phone number can not be left";
                        }
                        else if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(phNo)) {
                          return 'Incorrect phone number';
                        }
                        return null;

                      },

                    ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // buildEmailField(),
                    CustomTextField(
                      title: 'Password',
                      visible: true,
                      controller: passController,
                      validator: (pass){
                        if(pass!.isEmpty){
                          return "Password can not be empty";
                        }
                        else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(pass)) {
                          return 'Must contain minimum 8 characters, at least one letter\n and one number';
                        }
                        return null;

                      },
                    ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // buildEmailField(),
                    CustomTextField(
                      title: 'Confirm Password',
                      visible: true,
                      controller: passController2,
                      validator: (pass2){
                        if(pass2!.isEmpty){
                          return "Password can not be empty";
                        }
                        else if (passController.text!=pass2){return "Passwords don't match";}
                        else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(pass2)) {
                          return 'Must contain minimum 8 characters, at least one letter\n and one number';
                        }
                        return null;

                      },

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(buttonText: "Sign up",func: (){
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },btnAlign: Alignment.center,),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(text: 'Back to Login',
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Welcome()),
                                  );
                                }
                          )


                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
