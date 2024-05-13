import 'package:flutter/material.dart';
import 'package:todo/core/utilits/myValidation.dart';
import 'package:todo/ui/compant/customTextField.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName="register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/back_ground_auth.png"),),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                  controller: fullNameController,
                  validation:(text){
                    if(text==null||text.trim().isEmpty){
                      return("Enter valid name");
                    }
                  },
                decoration: InputDecoration(
                  hintText: "Full Name",
                ),
              ),
              CustomTextField(
                controller: EmailController,
                validation:(text){
                  if(text==null||text.trim().isEmpty){
                    return("Enter valid email");
                  }
                  if (! MyValidation .isValidEmail(text)){
                    return ("Enter valid email");
                  }
                },
                decoration: InputDecoration(
                  labelText: "Email address",
                ),
              ),
              CustomTextField(
                controller: passwordController,
                validation:(text){
                  if(text==null||text.trim().isEmpty){
                    return("Enter valid Password");
                  }
                  if(text.length<6){
                    return("Enter valid Password");
                  }
                },
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
              CustomTextField(
                controller: passwordConfirmationController,
                validation:(text){
                  if(text==null||text.trim().isEmpty){
                    return("Enter valid password");
                  }
                  if(passwordController.text!= text){
                    return("password doesn't match");
                  }
                },
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  onPressed: () {
                    register();
                  }, child: Text("Create Account",style: TextStyle(fontSize: 24,color: Colors.white),)),
              TextButton(onPressed: (){

              }, child: Text(
                "Already have Account",
              ))
            ],
          ),
        ),
      ),
      );
  }

  void register() {
    if(formKey.currentState?.validate()==false){
      return;
    }

  }
}

