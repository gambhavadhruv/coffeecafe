import 'package:flutter/material.dart';

import 'coffee_page_login.dart';

class Coffee_town extends StatelessWidget {
  const Coffee_town({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0x442814),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              child: Image(
                image: AssetImage('images/starbucks-logo-png-1666.png'),
                fit: BoxFit.cover,
              ),
            ),
            flex: 2,
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                'Get the best coffee \n         in town!',
                style: TextStyle(
                  color: Color.fromRGBO(0, 112, 74, 0.8),
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 70, top: 50),
              child: Center(
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70.0)),
                          primary: Color.fromRGBO(0, 112, 74, 0.8)),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(0, 112, 74, 0.8),
                            style: BorderStyle.solid,
                            width: 3.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Coffee_page_login();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70.0),
                              ),
                              primary: Colors.white),
                          child: Text(
                            "  Login  ",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 112, 74, 0.8),
                                fontSize: 28),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    primary: Colors.white),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(0, 112, 74, 0.8),
                        style: BorderStyle.solid,
                        width: 3.0,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 44, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(
                              Icons.facebook_rounded,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                          Container(
                            child: Text(
                              '  Continue with Facebook',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
