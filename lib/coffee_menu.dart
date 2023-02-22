import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'cappuccino.dart';
import 'espresso.dart';
import 'latte.dart';
import 'macciato.dart';
import 'mocha.dart';

class Coffee_menu extends StatelessWidget {
  const Coffee_menu({Key? key}) : super(key: key);

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
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return Espresso();
              }));
            },
            child: Container(
              child: Expanded(
                child: setRawmaterial(
                  text: 'Espresso',
                  image: 'images/coffeecup.jpg'
                ),
                flex: 1,
              ),
            ),
          ),
          InkWell(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Cappucino();
            }));

          },
            child: Container(
              child: Expanded(
                child: setRawmaterial(
                  text: 'Cuppeccino',
                    image: 'images/images.jpg'
                ),
                flex: 1,
              ),
            ),
          ),
          InkWell(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Macciato();
            }));

          },
            child: Container(
              child: Expanded(
                child: setRawmaterial(
                    text: 'Macciato',
                    image: 'images/macciato.jpg'
                ),
                flex: 1,
              ),
            ),
          ),
          InkWell(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Mocha();
            }));

          },
            child: Container(
              child: Expanded(
                child: setRawmaterial(
                    text: 'Mocha',
                    image: 'images/mocha.jpg'
                ),
                flex: 1,
              ),
            ),
          ),
          InkWell(onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Latte();
            }));

          },
            child: Container(
              child: Expanded(
                child: setRawmaterial(
                    text: 'Latte',
                    image: 'images/latte.jpg'
                ),
                flex: 1,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [],
            ),
            flex: 1,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: InkWell(
              child: Icon(Icons.home_outlined,
              color: Color.fromRGBO(0, 112, 74, 0.8),),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded,
                color: Color.fromRGBO(0, 112, 74, 0.8)),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,
            color: Color.fromRGBO(0, 112, 74, 0.8),),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
Widget setRawmaterial({String? text,image}){
  return Container(
    decoration: BoxDecoration(
      border: Border.symmetric(horizontal: BorderSide(color: Color.fromRGBO(0, 112, 74, 0.8)))
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10,left: 30,bottom: 10),
          height: 80,
          width: 80,
          child:
          Image.asset(
            image!
          ),
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
          child: Icon(Icons.arrow_forward_ios_sharp,
            color: Color.fromRGBO(0, 112, 74, 0.8),),
        )
      ],
    ),
  );
}
