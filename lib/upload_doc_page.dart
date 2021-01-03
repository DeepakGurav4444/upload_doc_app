import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadDocPage extends StatefulWidget {
  @override
  _UploadDocPageState createState() => _UploadDocPageState();
}

class _UploadDocPageState extends State<UploadDocPage> {
  File aadharImage;
  File panImage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            aadharImage == null
                ? buildUploadPageitem("Aadhar Card", size)
                : buildUploadedDoc(aadharImage, size),
            panImage == null
                ? buildUploadPageitem("Pan Card", size)
                : buildUploadedDoc(panImage, size),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildResetFloatingButton("RESET ", Icons.close, size),
                buildNextFloatingButton("NEXT ", Icons.arrow_forward_ios, size),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNextFloatingButton(String btnText, IconData btnIcon, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.greenAccent,
        height: size.height * 0.065,
        // width: size.width * 0.30,
        child: RaisedButton(
          onPressed: aadharImage == null || panImage == null ? null : () {},
          child: Row(
            children: <Widget>[
              Text(
                btnText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                btnIcon,
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildResetFloatingButton(String btnText, IconData btnIcon, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.greenAccent,
        height: size.height * 0.065,
        // width: size.width * 0.3,
        child: RaisedButton(
          onPressed: aadharImage == null && panImage == null
              ? null
              : () {
                  setState(() {
                    aadharImage = null;
                    panImage = null;
                  });
                },
          child: Row(
            children: <Widget>[
              Text(
                btnText,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                btnIcon,
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAadharImage(ImageSource imageSource) async {
    PickedFile aadharImg = await ImagePicker().getImage(source: imageSource);
    setState(() {
      aadharImage = File(aadharImg.path);
    });
  }

  getPanImage(ImageSource imageSource) async {
    PickedFile panImg = await ImagePicker().getImage(source: imageSource);
    setState(() {
      panImage = File(panImg.path);
    });
  }

  Widget buildUploadedDoc(File docImage, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.025),
      child: Container(
        height: size.height * 0.3,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
            File(docImage.path),
          )),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              spreadRadius: 1,
              color: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }

  Widget buildUploadPageitem(String txt, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.025),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2.0,
              spreadRadius: 1,
              color: Colors.greenAccent,
            )
          ],
        ),
        height: size.height * 0.3,
        width: size.width,
        child: Material(
          type: MaterialType.transparency,
          child: InkResponse(
            radius: size.width * 0.8,
            splashColor: Colors.grey[300],
             onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => dataSheet(size)),
              );
            },
            // showOptionDialogue(size, txt),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.upload_rounded,
                  size: size.width * 0.1,
                ),
                Text(
                  "Tap to Select $txt Image",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showOptionDialogue(Size size, String txt) {
    Dialog optionDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.3,
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                child: Text(
                  "Choose an Option",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => aadharImage == null
                        ? getAadharImage(ImageSource.camera)
                        : getPanImage(ImageSource.camera),
                    child: Container(
                      width: size.width * 0.35,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            size: size.width * 0.1,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.35,
                    child: GestureDetector(
                      onTap: () => aadharImage == null
                          ? getAadharImage(ImageSource.gallery)
                          : getPanImage(ImageSource.gallery),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.image,
                            size: size.width * 0.1,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
        useSafeArea: true,
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => optionDialog);
  }

  Widget dataSheet(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.3,
        width: size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: Text(
                "Choose an Option",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => aadharImage == null
                      ? getAadharImage(ImageSource.camera)
                      : getPanImage(ImageSource.camera),
                  child: Container(
                    width: size.width * 0.35,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.camera,
                          size: size.width * 0.1,
                        ),
                        Text("Camera")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.35,
                  child: GestureDetector(
                    onTap: () => aadharImage == null
                        ? getAadharImage(ImageSource.gallery)
                        : getPanImage(ImageSource.gallery),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.image,
                          size: size.width * 0.1,
                        ),
                        Text("Gallery")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
