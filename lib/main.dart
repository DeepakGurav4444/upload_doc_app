import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:upload_doc_app/my_camera.dart';
import 'package:upload_doc_app/pages/register.dart';
import 'package:upload_doc_app/pages/registeration_page.dart';

import 'bottom_page.dart';

List<CameraDescription> cameras;
// Future<void>
void main()
// async
{
  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Register(),
      //  MyCamera(cameras: cameras),
    );
  }
}
