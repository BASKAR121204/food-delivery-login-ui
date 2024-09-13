import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:login/colors.dart';
import 'package:login/constants.dart';
import 'package:login/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
GlobalKey<FormState>formkey=GlobalKey<FormState>();
String? _email,_password;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body:GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child:Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start ,
              children:<Widget> [
                Stack(
                  children:<Widget> [
                          
                 Image.asset(
                  bgImage,
                  height: height*0.40,
                  width: width,
                  fit: BoxFit.cover,
              ),
              Container(
                height: height*0.42,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0.3,0.8],
                    begin:Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[
                    Colors.transparent,
                    Colors.white
                  ] )
                ),
                // color: Colors.orange
              ),  
                Positioned(
                      bottom:5,
                      left: 0,
                      right: 0,
             child:Center(
               child:Column(
                 children: [
                   Text(appName,style: TextStyle(
                      fontSize: 25,
                      fontWeight:FontWeight.w600
                     ),
                     ),
                      Text(slogan,style: TextStyle(
              color: Colors.grey),
              ),
                 ],
               ),
             ),
               ), 
               ], 
               ), 
               Padding(padding:const EdgeInsets.only(left: 10,top: 20),
            child: Container(
              child:Text("  $login_string ",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
              ),
              decoration: BoxDecoration(
              gradient: LinearGradient(
                    colors:[
                    primaryColor.withOpacity(0.2),
                   Colors.transparent
                  ] ),
                  border:Border(left: BorderSide(color: primaryColor,width: 5)) 
                  ),
               ),
               ),
              Padding(
                 padding:const EdgeInsets.all(10),
                 child: TextFormField(
                  onSaved:(value){
                    _email=value;
                  },
                  validator: (email){
                    if(email==null||email.isEmpty)
                    return "please enter Email";
                    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                     .hasMatch(email))
                            return "its not a valid Email";
                    return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:primaryColor)),
                    prefixIcon: Icon(Icons.email,color: primaryColor),
                    labelText: "Email address",labelStyle:TextStyle(color: primaryColor,
                    fontSize: 16)
                  ),
                 ),
               ),
            
                Padding(
                 padding:const EdgeInsets.all(10),
                 child: TextFormField(
                  onSaved: (value){
                    _password=value;
                  },
                  validator: (password){
                    if (password==null||password.isEmpty)
                        return "please enter password";
                    else if(password.length<8)
                        return "please enter atleast 8 charector";
                    else if(password.length>32)
                        return "please enter less than 32 charectors";
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:primaryColor)),
                    prefixIcon: Icon(Icons.lock_open,color: primaryColor),
                    labelText: "password",labelStyle:TextStyle(color: primaryColor,
                    fontSize: 16)
                  ),
                 ),
               ),
               Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed:(){}, child:Text(forgettext)
                )
                ),
               Center(
                child: SizedBox(
                  height: height*0.08,
                  width: width-30,
                  child: TextButton(
                    style:TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: (){
                      if(formkey.currentState?.validate()??true)
                      {
                        formkey.currentState?.save();
                        print(_email);
                        print(_password);
                      }
                      FocusScope.of(context).unfocus();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);
                    }, child: Text(login_account,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),
                    ),
                    ),
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Text("don't have a account?"),
                         TextButton(onPressed:(){}, child:Text("create account",style:TextStyle(color:  Colors.blue,fontSize: 16),
                         )
                         )
                      ],
                    )
                   
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}