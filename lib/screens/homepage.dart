import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quantumapp/Auth/fauth.dart';
import 'package:quantumapp/screens/Productdetails.dart';
import 'package:quantumapp/screens/account.dart';
import 'package:quantumapp/screens/category.dart';
import 'package:quantumapp/screens/loading.dart';
import 'package:quantumapp/services/services.dart';
import 'package:quantumapp/models/Product_model.dart';
import '../models/article_model.dart';
import 'package:quantumapp/AppData/AppWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> _productModel;

  List<ProductModel> _otherproducts;

  List<String> _categories;

  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _productModel = await ApiService().getProducts();
    _categories = await ApiService().getCategories();
    _otherproducts = await ApiService().getotherProducts();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    CommonWidgets commonWidgets = new CommonWidgets();
    return loading
        ? Spinkit()
        : Scaffold(
            body: ListView(shrinkWrap: true, children: [
              commonWidgets.AppBar(),
              commonWidgets.sizedBox(30),
              commonWidgets.pageTitle("Our", "Products"),
              commonWidgets.sizedBox(10),
              commonWidgets.search(),
              commonWidgets.sizedBox(20),
              commonWidgets.categoryWidget(_categories),
              commonWidgets.sizedBox(20),
              commonWidgets.subtitle("Top Deals"),
              commonWidgets.dealsOfTheday(_productModel, context),
              commonWidgets.sizedBox(10),
              commonWidgets.subtitle("Other Products"),
              commonWidgets.sizedBox(10),
              commonWidgets.otherProducts(_otherproducts, context),
            ]),
          );
  }
}
