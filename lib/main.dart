import 'package:bucaplogin/src/bloc/provider.dart';
import 'package:bucaplogin/src/screens/homePage.dart';
import 'package:bucaplogin/src/screens/loginPage.dart';
import 'package:bucaplogin/src/screens/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home': (BuildContext context) => HomePage(),
        },
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
