import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_model.dart';
import 'package:flutter_icons/flutter_icons.dart';
class BottomPage extends StatefulWidget {
  @override
  _BottomPageState createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavModel>(
      create: (context) => BottomNavModel(),
      child: Consumer<BottomNavModel>(
        builder: (context, model, child) => Scaffold(
          bottomNavigationBar: Row(
            children: <Widget>[
              buildNavBarItem(
                  MaterialCommunityIcons.close, Icons.home_outlined, 0, "CLOSED", model),
              buildNavBarItem(
                  Icons.search, Icons.search_outlined, 1, "LIVE", model),
              buildNavBarItem(Icons.shopping_cart, Icons.shopping_cart_outlined,
                  2, "UPCOMING", model),            ],
          ),
          body: model.currentPage,
        ),
      ),
    );
  }
  Widget buildNavBarItem(IconData solidIcon, IconData outlineIcon, int index,
      String title, BottomNavModel model) {
    return InkResponse(
      radius: MediaQuery.of(context).size.width * 0.15,
      splashColor: Colors.grey[75],
      onTap: () {
        model.currentTab = index;
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              index == model.currentTab ? solidIcon : outlineIcon,
              color: index == model.currentTab ? Colors.orange : Colors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: index == model.currentTab ? Colors.orange : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}