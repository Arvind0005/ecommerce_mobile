import 'package:flutter/material.dart';
import 'package:quantumapp/AppData/AppWidgets.dart';
import 'package:quantumapp/screens/loading.dart';
import 'package:quantumapp/services/services.dart';

import '../models/Product_model.dart';
import 'Productdetails.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage(this.category);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ProductModel> _categoryProducts;

  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  void _getdata() async {
    _categoryProducts = await ApiService().getCategoryProducts(widget.category);
    setState(() {
      loading = false;
    });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    CommonWidgets commonWidgets = CommonWidgets();
    return loading
        ? Spinkit()
        : Scaffold(
            body: ListView(
              children: [
                commonWidgets.AppBar(),
                commonWidgets.sizedBox(30),
                commonWidgets.pageTitle(widget.category, "Products"),
                commonWidgets.sizedBox(10),
                commonWidgets.search(),
                commonWidgets.sizedBox(
                  10,
                ),
                commonWidgets.subtitle("Trending Products!"),
                commonWidgets.sizedBox(
                  10,
                ),
                commonWidgets.CategoryProducts(_categoryProducts, context),
                commonWidgets.sizedBox(10),
                commonWidgets.subtitle("Other Products !"),
                commonWidgets.CategoryProducts(_categoryProducts, context),
              ],
            ),
          );
  }
}
