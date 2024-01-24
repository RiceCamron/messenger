import 'package:flutter/material.dart';
import 'package:messenger/HomeScreen/HomeScreen.dart';
import 'package:messenger/Models/user.dart';


Future<void> main() async {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User("1", "username", "phone", "email", "password");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Color.fromRGBO(19, 30, 52, 1),
        ),
        home: HomeScreen(user: user,));
  }
}
