import 'package:flutter/material.dart';
import 'package:quantumapp/screens/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quantumapp/screens/bottom_nav.dart';
import 'package:quantumapp/screens/cartPage.dart';
import 'package:quantumapp/screens/category.dart';
import 'package:quantumapp/screens/homepage.dart';
import 'package:quantumapp/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _prefs;
  List<String> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void initialiseDb() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList('cart', <String>[]);
    items = _prefs.getStringList('cart');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}
