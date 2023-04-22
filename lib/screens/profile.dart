import 'package:flutter/material.dart';
import 'package:quantumapp/AppData/AppWidgets.dart';
import 'package:quantumapp/models/Product_model.dart';
import 'package:quantumapp/screens/loading.dart';
import 'package:quantumapp/services/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProductModel> _productModel;
  List<ProductModel> _otherproducts;
  bool loading = true;

  Widget _appBar() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Arvind",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.phone))
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  void _getdata() async {
    _productModel = await ApiService().getProducts();
    _otherproducts = await ApiService().getotherProducts();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    CommonWidgets commonWidgets = CommonWidgets();
    return loading
        ? Spinkit()
        : Scaffold(
            body: ListView(
              children: [
                _appBar(),
                commonWidgets.sizedBox(
                  10,
                ),
                Row(children: [
                  Spacer(),
                  Container(
                    child: Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  Spacer(),
                ]),
                commonWidgets.sizedBox(10),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1000 coins Won",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.orange,
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                      child: Text(
                    "useremail00@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  )),
                ),
                FlatButton(onPressed: () {}, child: Text("Edit Profile")),
                //  SizedBox(height: 10),
                Row(
                  children: [
                    //Spacer(),
                    SizedBox(
                      width: 70,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.domain),
                      color: Colors.orange,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.dashboard_outlined),
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    //  Spacer(),
                  ],
                ),
                //Siz
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 0.5,
                    //child: ,
                  ),
                ),
                commonWidgets.sizedBox(10),
                commonWidgets.subtitle("Past Orders"),
                commonWidgets.dealsOfTheday(_productModel, context),
                commonWidgets.subtitle("WishList"),
                commonWidgets.otherProducts(_otherproducts, context),
              ],
            ),
          );
  }
}
