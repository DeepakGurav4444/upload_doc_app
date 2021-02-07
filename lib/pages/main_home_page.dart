import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:upload_doc_app/bottom_nav_model.dart';
import 'package:upload_doc_app/widgets/main_drawer.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavModel>(
      create: (context) => BottomNavModel(),
      child: Consumer<BottomNavModel>(
        builder: (context, model, child) => Scaffold(
          drawer: MainDrawer(),
          bottomNavigationBar: Row(
            children: <Widget>[
              buildNavBarItem(
                  FontAwesome.home, Icons.home_outlined, 0, "Home", model),
              buildNavBarItem(
                  Icons.work, Icons.work_outline, 1, "Carriers", model),
              buildNavBarItem(Icons.history_outlined, Icons.history_toggle_off,
                  2, "History", model),
              buildNavBarItem(MaterialCommunityIcons.newspaper,
                  FontAwesome.newspaper_o, 3, "News", model),
            ],
          ),
          appBar: AppBar(
            title: Center(
              child: Text("ShareIndia"),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.person), onPressed: () {})
            ],
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
        width: MediaQuery.of(context).size.width / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              index == model.currentTab ? solidIcon : outlineIcon,
              color: index == model.currentTab ? Colors.blue : Colors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: index == model.currentTab ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
