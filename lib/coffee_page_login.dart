import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coffee_menu.dart';

class Coffee_page_login extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  var usernamecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromRGBO(0, 112, 74, 0.8), // <-- SEE HERE
        ),
        centerTitle: true,
        title: Center(
            child: Text(
          'LOGIN',
          style: TextStyle(color: Color.fromRGBO(0, 112, 74, 0.8)),
        )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(23),
            child: Container(
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    color: Color.fromRGBO(0, 112, 74, 0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        controller: usernamecontroller,

                        style: TextStyle(color: Colors.black, fontSize: 20),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter Email";
                          }
                          else if(value!='dhruvgambhava@gmail.com'){
                            return 'invalid email';
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 55, bottom: 15),
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        obscureText: true,
                        obscuringCharacter: '\*',
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "enter password";
                          }
                          else if(value!.length<7){
                            return "password must be contains 8 charecters";
                          }
                          else if(value!='12345678'){
                            return 'invalid password';
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 112, 74, 0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            flex: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 115),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextButton(onPressed: () {
                        if(formkey.currentState!.validate()){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Coffee_menu();
                          }));
                        }
                      },
                          child: Text('Log in',
                          style: TextStyle(
                            color: Colors.white,

                            fontSize: 20
                          ))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(0, 112, 74, 0.8)
                      ),
                    ),
                    Center(
                        child: Padding(
                           padding: const EdgeInsets.only(left: 110,top: 5),
                           child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                           Text("Don't have an account?"),
                           TextButton(onPressed: () {},
                           child: Text('Register',
                           style: TextStyle(
                           color: Color.fromRGBO(0, 112, 74, 0.8),
                           fontWeight: FontWeight.bold
                          ),))
                           ],),
                        ),
                        )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
