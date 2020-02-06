import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_0/model/api.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;
class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {

  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Qrcode Scanner Example'),
        ),
        body:
        Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.memory(bytes),
              ),
              RaisedButton(onPressed: _scan, child: Text("Scan",style: TextStyle(color: Colors.white),),color: Colors.blue,),
              new FutureBuilder<String>(// async work
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting: return new Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      else
                        return new Text('Result: $barcode');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _scan() async {
    final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
    Future<Post> createPost(String url, {Map body}) async {
      return http.post(url, body: body).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error while fetching data");
        }
        return Post.fromJson(json.decode(response.body));
      });
    }
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
      Post newPost = new Post(
          userId: '$barcode ',);
      Post p = await createPost(CREATE_POST_URL,
          body: newPost.toMap());
      print(p.userId);

  }
  Widget DETIALS(String name){
    return Column(
       children: <Widget>[
      Image.asset(''),
      Text('name:$name')
       ],
    );
  }
}
