import 'package:flutter/material.dart';
import 'package:flutter_0/screens/login_employee.dart';
import 'login_manager.dart';


class manage extends StatefulWidget {
  @override
  _manageState createState() => _manageState();
}

class _manageState extends State<manage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
         containt('employee',login_manager()),
          containt('manager',LoginPage())
        ],
      ),
    );
  }
  Widget containt(String name,var d){
    return  Padding(
      padding: const EdgeInsets.only(top: 60.0,right: 25.0,left: 20.0),
      child: InkWell(
     onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> d));},
        child: Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height/3,
          decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.all(Radius.circular(50.0))
          ),
        child: Center(child: Text(name,style: TextStyle(color: Colors.white,fontSize: 35.0),)),
        ),
      ),
    );
  }
}
