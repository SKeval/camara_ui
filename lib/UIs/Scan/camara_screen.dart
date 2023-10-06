// ignore_for_file: camel_case_types
import 'dart:io' show Platform;

import 'package:camara_ui/UIs/Scan/Parts/bottom_screen.dart';
import 'package:camara_ui/UIs/Scan/Parts/top_screen.dart';
import 'package:camara_ui/UIs/Gallery/main_screen.dart';
import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Utils/text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camara_Screen extends StatefulWidget {
  const Camara_Screen(
      {super.key,
      required this.cameraController,
      required this.changeCamera,
      required this.cameras});
  final CameraController cameraController;
  final List<CameraDescription> cameras;
  final Future<void> Function({required bool frontcamera}) changeCamera;

  @override
  State<Camara_Screen> createState() => _Camara_ScreenState();
}

class _Camara_ScreenState extends State<Camara_Screen> {
  bool isfront = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ignore: unnecessary_null_comparison
          widget.cameraController == null
              ? Container(
                  decoration: BoxDecoration(
                      color: bgcolor, borderRadius: BorderRadius.circular(12)),
                )
              : GestureDetector(
                  //change camera sides
                  onDoubleTap: () async {
                    isfront = !isfront;
                    setState(() {
                      widget.changeCamera(frontcamera: isfront);
                    });
                                    },
                  child: Builder(builder: (BuildContext builder) {
                    var camera = widget.cameraController.value;
                    final fullSize = MediaQuery.of(context).size;
                    final size = Size(fullSize.width,
                        fullSize.height - (Platform.isIOS ? 90 : 0));
                    double scale;
                    try {
                      scale = size.aspectRatio * camera.aspectRatio;
                    } catch (e) {
                      scale = 1.0;
                    }
                    if (scale < 1) scale = 1 / scale;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Transform.scale(
                        scale: scale,
                        child: Center(
                            child: CameraPreview(widget.cameraController)),
                      ),
                    );
                  }),
                ),
          Top_screen(
              cameras: widget.cameras,
              changeCamera: widget.changeCamera,
              cameraController: widget.cameraController),
          Bottom_Screen(
              changeCamera: widget.changeCamera,
              cameraController: widget.cameraController),
          Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Gallery_Screen(),
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(gallery),
                      const SizedBox(
                        width: 5,
                      ),
                      text(
                        "Dairy",
                        size: 20,
                      )
                    ],
                  ),
                ),
              ))

          // scanner
        ],
      ),
    );
  }
}
/*
                   Container(
                    height: height / 1,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: CameraPreview(widget.cameraController!),
                  )*/