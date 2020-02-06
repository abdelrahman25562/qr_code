import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper{

  String serverUrl = "https://hearts2020.com/api/auth/login";

  var status ;
  var token ;

  loginData(String email , String password) async{

    String myUrl = "$serverUrl/login1";

    final response = await  http.post(myUrl,

        headers: {

          'Accept':'application/json'

        },

        body: {

          "email": "$email",

          "password" : "$password"

        } ) ;

    status = response.body.contains('error');



    var data = json.decode(response.body);



    if(status){

      print('data : ${data["error"]}');

    }else{

      print('data : ${data["token"]}');

      _save(data["token"]);

    }



  }



  registerData(String name ,String email , String password) async{



    String myUrl = "$serverUrl/register1";

    final response = await  http.post(myUrl,

        headers: {

          'Accept':'application/json'

        },

        body: {

          "name": "$name",

          "email": "$email",

          "password" : "$password"

        } ) ;

    status = response.body.contains('error');



    var data = json.decode(response.body);



    if(status){

      print('data : ${data["error"]}');

    }else{

      print('data : ${data["token"]}');

      _save(data["token"]);

    }



  }

  _save(String token) async {

    final prefs = await SharedPreferences.getInstance();

    final key = 'token';

    final value = token;

    prefs.setString(key, value);

  }
  read() async {

    final prefs = await SharedPreferences.getInstance();

    final key = 'token';

    final value = prefs.get(key ) ?? 0;

    print('read : $value');

  }
}