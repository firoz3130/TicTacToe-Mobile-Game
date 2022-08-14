import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: Icon(
            Icons.playlist_add,
            color: Colors.white,
          ),
          title: Center(
            child: Text(
              "Tic Tac Toe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: 'chalk',
              ),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Home(),
      ),
    );
  }
}
