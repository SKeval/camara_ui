import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class Top_screen extends StatefulWidget {
  const Top_screen({super.key, this.cameraController});
  final CameraController? cameraController;

  @override
  State<Top_screen> createState() => _Top_screenState();
}

class _Top_screenState extends State<Top_screen> {
  bool ison = false;

  _switchlight() async {
    ison ? await TorchLight.disableTorch() : await TorchLight.enableTorch();
    setState(() {
      ison = !ison;
    });
  }

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
                final image = await widget.cameraController!.takePicture();
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
                _switchlight();
              },
            )),
      ],
    );
  }
}
