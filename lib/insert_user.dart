import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Insertuser extends StatefulWidget {

  Insertuser(this.map);
  Map? map;

  @override
  State<Insertuser> createState() => _InsertuserState();
}

class _InsertuserState extends State<Insertuser> {
  var formkey = GlobalKey<FormState>();

  var namecontroller = TextEditingController();
  var imagecontroller = TextEditingController();

  // var idcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // namecontroller.text = widget.map==null?'':widget.map!['id'];
    namecontroller.text = widget.map==null?'':widget.map!['name'];
    imagecontroller.text = widget.map==null?'':widget.map!['avtar'];
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter Name'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Enter valid Name';
                }
              },
              controller: namecontroller,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter Image URL'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Enter valid Image URL';
                }
              },
              controller: imagecontroller,
            ),
            TextButton(onPressed: () {
              if(formkey.currentState!.validate()){
                if(widget.map == null){
                  insertuser().then((value) => Navigator.of(context).pop(true));
                }
                else{
                  updateuser(widget.map!['id']).then((value) => Navigator.of(context).pop(true));
                }

              }
            }, child: widget.map==null?Text('Submit'):Text('Update'))
          ],
        ),
      ),
    );
  }


  Future<void> updateuser(id) async {
    Map map = {};
    // map["id"] = idcontroller.text;
    map["name"] = namecontroller.text;
    map["avatar"] = imagecontroller.text;
    var list1 = await http.put(Uri.parse('https://630d9e86b37c364eb7078fd9.mockapi.io/student/$id'),body: map);
  }

  Future<void> insertuser() async {
    Map map = {};
    // map["id"] = idcontroller.text;
    map["name"] = namecontroller.text;
    map["avatar"] = imagecontroller.text;
    var list1 = await http.post(Uri.parse('https://630d9e86b37c364eb7078fd9.mockapi.io/student'),body: map);
    print(list1.body);
  }
}