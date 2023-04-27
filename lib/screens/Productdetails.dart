import 'package:flutter/material.dart';
import 'package:quantumapp/AppData/AppWidgets.dart';
import 'package:quantumapp/models/Product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductDetail extends StatefulWidget {
  final ProductModel productModel;
  ProductDetail(this.productModel);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var _prefs;
  List<String> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  void _getdata() async {
    _prefs = await SharedPreferences.getInstance();
    items = _prefs.getStringList('cart');
  }

  Widget button(String title) {
    return Row(
      children: [
        Spacer(),
        // height: 30,
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 50,
          width: 300,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.red,
              onPressed: () async {
                String productString = json.encode(widget.productModel);

                if (items == [])
                  items.insert(0, productString);
                else
                  items.add(productString);
                await _prefs.setStringList('cart', items);
              },
              child: Text(title)),
        ),
        Spacer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    CommonWidgets commonWidgets = CommonWidgets();
    return Scaffold(
      body: ListView(
        children: [
          commonWidgets.AppBar(),
          commonWidgets.sizedBox(30),
          commonWidgets.pageTitle("product", widget.productModel.title),
          commonWidgets.sizedBox(10),
          commonWidgets.search(),
          commonWidgets.sizedBox(20),
          Container(
            width: width,
            height: width,
            child: Image.network(
              widget.productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.productModel.description,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.productModel.price.toString() + "/-",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          commonWidgets.sizedBox(
            10,
          ),
          button("Add to Cart"),
          commonWidgets.sizedBox(
            10,
          ),
          button("Buy Now"),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
