import 'dart:io';

//import 'package:camara_ui/UIs/Scan/Parts/scan_detection.dart';
import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/datalists.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Utils/text.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key, this.cameraController, required this.changeCamera});
  final CameraController? cameraController;
  final Future<void> Function({required bool frontcamera}) changeCamera;

  @override
  State<Scanner> createState() => _ScannerState();
}

int locator = 0;
String dropdownValue = 'English';

class _ScannerState extends State<Scanner> {
  bool isfront = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 1.05,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            button(
                              bgcolor: const Color.fromARGB(255, 94, 89, 89),
                              image: Image.asset(
                                close,
                                height: 25,
                                width: 25,
                              ),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(width: width / 3.7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text("Scanning...", size: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          //mddle
          Positioned(
              top: 120,
              child: Image.asset(
                scan,
                height: height / 1.7,
              )),
          Positioned(
              bottom: 95,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  width: width / 1.5,
                  height: height / 14,
                  child: locator == 0
                      ? Center(
                          child: text("XXXXXXXXXXXX",
                              color: Colors.black, weight: FontWeight.bold),
                        )
                      : Center(
                          child: DropdownButton(
                            underline: SizedBox(),
                            value: dropdownValue,
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            items: listDropDown,
                            onChanged: (value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                          ),
                        ))),

          //Down
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 10,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('location');
                        setState(() {
                          locator = 0;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            location,
                            height: 35,
                            width: 35,
                          ),
                          text("Place",
                              color: Colors.black,
                              weight: FontWeight.w700,
                              size: 16)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('translator');
                        setState(() {
                          locator = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 35,
                            width: 35,
                            translator,
                          ),
                          text("Translator",
                              color: Colors.black,
                              weight: FontWeight.bold,
                              size: 16)
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
