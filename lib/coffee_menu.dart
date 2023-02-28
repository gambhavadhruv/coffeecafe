import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cappuccino.dart';
import 'espresso.dart';
import 'insert_user.dart';
import 'latte.dart';
import 'macciato.dart';
import 'mocha.dart';

class Coffee_menu extends StatefulWidget {
  const Coffee_menu({Key? key}) : super(key: key);

  @override
  State<Coffee_menu> createState() => _Coffee_menuState();
}

class _Coffee_menuState extends State<Coffee_menu> {
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
          'Menu',
          style: TextStyle(color: Color.fromRGBO(0, 112, 74, 0.8)),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: InkWell(
                  child: Icon(Icons.add_outlined,
                      color: Color.fromRGBO(0, 112, 74, 0.8)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return Insertuser();
                    },)).then((value) {
                      if(value==true){
                        setState(() {

                        });
                      }
                    });
                  },),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Insertuser(map: snapshot.data![index],);
                      },
                    )).then((value) {
                      if (value == true) {
                        setState(() {});
                      }
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data![index]['id'].toString(),
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 112, 74, 0.8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('  '),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    child: Image.network(
                                        '${snapshot.data![index]['avatar']}'),
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 45.0),
                                  child: Text(
                                    snapshot.data![index]['name'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color.fromRGBO(0, 112, 74, 0.8)),
                                  ),
                                ),
                                // Image(image: snapshot.data![index]['avatar'])
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getdatafromapi(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(
                Icons.home_outlined,
                color: Color.fromRGBO(0, 112, 74, 0.8),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded,
                color: Color.fromRGBO(0, 112, 74, 0.8)),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Color.fromRGBO(0, 112, 74, 0.8),
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

Widget setRawmaterial({String? text, image}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(color: Color.fromRGBO(0, 112, 74, 0.8)))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 30, bottom: 10),
          height: 80,
          width: 80,
          child: Image.asset(image!),
        ),
        Container(
          // margin: EdgeInsets.only(left: 50),
          child: Text(
            text!,
            style: TextStyle(
                color: Color.fromRGBO(0, 112, 74, 0.8),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 205),
          child: Icon(
            Icons.arrow_forward_ios_sharp,
            color: Color.fromRGBO(0, 112, 74, 0.8),
          ),
        )
      ],
    ),
  );
}

Future<List<dynamic>> deletedatafromweb(id) async {
  http.Response res = await http.delete(
      Uri.parse('https://630d9e86b37c364eb7078fd9.mockapi.io/student/$id'));
  List<dynamic> list = jsonDecode(res.body.toString());
  return list;
}

Future<List<dynamic>> getdatafromapi() async {
  http.Response res = await http
      .get(Uri.parse('https://630d9e86b37c364eb7078fd9.mockapi.io/student'));
  List<dynamic> list = jsonDecode(res.body.toString());
  return list;
}
