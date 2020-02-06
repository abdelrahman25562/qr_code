import 'package:flutter/material.dart';
import 'package:flutter_0/screens/login_employee.dart';
import 'package:flutter_0/screens/manage.dart';
import 'screens/login_manager.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  final String title='';

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter CRUD API',

      theme: ThemeData(



        primarySwatch: Colors.blue,

      ),

      home: manage(),

      routes: <String,WidgetBuilder>{
        '/MANAGE':(BuildContext context)=> new manage(),
        '/login_manager' : (BuildContext context) => new login_manager(title:title),
        '/login_employee':(BuildContext context) =>new LoginPage(title:title),
        '/QR_code':(BuildContext context)=>  new MyApp()

      },

    );

  }

}