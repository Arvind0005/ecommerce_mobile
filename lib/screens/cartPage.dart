import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantumapp/AppData/AppWidgets.dart';
import 'package:quantumapp/models/Product_model.dart';
import 'package:quantumapp/screens/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _prefs;
  List<String> items;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
    setState(() {
      loading = false;
    });
  }

  void _getdata() async {
    _prefs = await SharedPreferences.getInstance();
    items = await _prefs.getStringList('cart');
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    CommonWidgets commonWidgets = CommonWidgets();
    return items == null
        ? Spinkit()
        : Scaffold(
            body: ListView(
              children: [
                commonWidgets.AppBar(),
                commonWidgets.sizedBox(30),
                commonWidgets.pageTitle("Your", "Cart"),
                commonWidgets.sizedBox(10),
                commonWidgets.search(),
                commonWidgets.sizedBox(20),
                Container(
                  height: 450,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 100,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Image.network(
                                          json.decode(items[index])['image'],
                                          fit: BoxFit.fill,
                                        ),
                                        height: 100,
                                        width: 100,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                json.decode(
                                                    items[index])['title'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              json.decode(
                                                  items[index])['description'],
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                json
                                                        .decode(items[index])[
                                                            'price']
                                                        .toString() +
                                                    "/-",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
  }
}
