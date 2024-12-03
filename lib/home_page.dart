import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  String name = "";
  SharedPreferences? prefs;

  @override
  void initState(){
    super.initState();
    ///get data here
    getData();

  }

  getData() async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("name") ?? "";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    nameController.text = name;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: Column(
        children: [
          name!= "" ? Text("Welcome, $name", style: TextStyle(fontSize: 25),) : Container(),
          TextField(controller: nameController,),
          ElevatedButton(onPressed: ()async{
            ///set data here
            prefs!.setString("name", nameController.text);
            getData();

          }, child: Text('Save'))
        ],
      ),
    );
  }
}


class A{

  A();
}