import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'QR.dart';
import '../model/databacehelper.dart';

class login_manager extends StatefulWidget{

  login_manager({Key key , this.title}) : super(key : key);
  final String title;
  @override
  login_managerState  createState() => login_managerState();
}
class login_managerState extends State<login_manager> {
  read() async {

    final prefs = await SharedPreferences.getInstance();

    final key = 'token';

    final value = prefs.get(key ) ?? 0;

    if(value != '0'){
    }
  }
  @override
  initState(){
    read();
  }
  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.loginData(_emailController.text.trim().toLowerCase(),
            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check email or password';
          }else{
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> QR()));
          }

        });

      }

    });

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Login'),
        ),
        body: Container(

          child: ListView(

            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),

            children: <Widget>[

              Container(

                height: 50,

                child: new TextField(

                  controller: _emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(

                    labelText: 'Email',

                    hintText: 'Place your email',

                    icon: new Icon(Icons.email),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Place your password',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.blue,
                  child: new Text(
                    'Login',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  '$msgStatus',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: new Text('Failed'),
            content:  new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}

