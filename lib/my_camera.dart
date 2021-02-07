import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:upload_doc_app/main.dart';

class MyCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  const MyCamera({Key key, this.cameras}) : super(key: key);
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  CameraController _controller;
  @override
  void initState() {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.high);
    _controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Open Camera"),
          onPressed: () => showCamera(),
        ),
      ),
    );
  }

  showCamera() {
    if (!_controller.value.isInitialized) {
      return new Container();
    } else {
      return AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: CameraPreview(_controller));
    }
  }
}
