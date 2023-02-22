import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cappucino extends StatelessWidget {

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
              'Cappuccino',
              style: TextStyle(color: Color.fromRGBO(0, 112, 74, 0.8)),
            )),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/cappuccino2.jpg'),
                  height: 400,
                  width: 400,)
              ],
            ),
          ),),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',
                  style: TextStyle(color: Color.fromRGBO(0, 112, 74, 0.8),
                      fontSize: 25),
                  textAlign: TextAlign.start,),
                Text('42 EGP',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),)
              ],
            ),
          ),),
          Expanded(child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: 190.0, vertical: 19.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0)),
                    primary: Color.fromRGBO(0, 112, 74, 0.8)),
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
