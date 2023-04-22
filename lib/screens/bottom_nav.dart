import 'package:flutter/material.dart';
import 'package:quantumapp/screens/cartPage.dart';
import 'package:quantumapp/screens/homepage.dart';
import 'package:quantumapp/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  int index = 0;
  List<Widget> widgets = [HomePage(), CartPage(), ProfilePage()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1000.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff64485C),
        unselectedItemColor: Color(0xff99737E),
        // backgroundColor: Color(0xffF64C72),
        // selectedItemColor: Colors.white, Color(0xffEDC7B7),
        // unselectedItemColor: Color(0xff99737E),
        onTap: (int x) {
          setState(() {
            index = x;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Products"
              // title: Text("Find jobs",
              //     style: TextStyle(fontWeight: FontWeight.bold))
              ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            // title: Text("Create job",
            //     style: TextStyle(fontWeight: FontWeight.bold)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            // title: Text("History",
            //     style: TextStyle(fontWeight: FontWeight.bold))
          ),
        ],
      ),
      body: widgets[index],
    );
  }
}
