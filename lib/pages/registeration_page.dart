import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upload_doc_app/pages/registration_component/personal_deatails.dart';

class RegisterationPage extends StatefulWidget {
  @override
  _RegisterationPageState createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> _registerNavigatorKey =
        GlobalKey<NavigatorState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.05),
              child: Center(
                child: Text(
                  "Registeration Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.035,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              height: size.height * 0.7,
              width: size.width * 0.85,
              child: SafeArea(
                child: WillPopScope(
                  onWillPop: () async =>
                      !await _registerNavigatorKey.currentState.maybePop(),
                  child: Navigator(
                    key: _registerNavigatorKey,
                    onGenerateRoute: (settings) {
                      switch (settings.name) {
                        // case '/step1':
                        //   return CupertinoPageRoute(
                        //       builder: (context) => ContactDetails());
                        //   break;
                        // case '/step2':
                        //   return CupertinoPageRoute(
                        //       builder: (context) => DocumentDeatails());
                        //   break;
                        // case '/step3':
                        //   return CupertinoPageRoute(
                        //       builder: (context) => LocationDeatails());
                        //   break;
                        default:
                          return CupertinoPageRoute(
                            builder: (context) =>
                                PersonalDetails(size: size),
                          );
                      }
                    },
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 1,
                    color: Colors.lightBlueAccent,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
