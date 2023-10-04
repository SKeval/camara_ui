import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:camera/camera.dart';
import 'package:camara_ui/Utils/datalists.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class Top_screen extends StatefulWidget {
  Top_screen(
      {super.key,
      required this.cameraController,
      required this.changeCamera,
      required this.cameras});
  CameraController cameraController;
  final List<CameraDescription> cameras;
  final Future<void> Function({required bool frontcamera}) changeCamera;

  @override
  State<Top_screen> createState() => _Top_screenState();
}

class _Top_screenState extends State<Top_screen> {
  bool ison = false;
  bool isfront = true;

  // _switchlight() async {
  //   ison ? await TorchLight.disableTorch() : await TorchLight.enableTorch();
  //   setState(() {
  //     ison = !ison;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 10,
            left: 15,
            child: button(
                image: Image.asset(
              close,
              height: 25,
              width: 25,
            ))),
        Positioned(
            top: 10,
            right: 15,
            child: button(
              image: Image.asset(
                camera,
                height: 25,
                width: 25,
              ),
              onPressed: () async {
                isfront = !isfront;
                setState(() {
                  widget.changeCamera(frontcamera: isfront);
                });
              },
            )),
        Positioned(
            top: 60,
            right: 15,
            child: button(
              image: Image.asset(
                flash,
                height: 25,
                width: 25,
              ),
              onPressed: () {
                setState(() {
                  ison = !ison;
                });
                ison
                    ? widget.cameraController.setFlashMode(FlashMode.torch)
                    : widget.cameraController.setFlashMode(FlashMode.off);
                //_switchlight();
              },
            )),
      ],
    );
  }
}
