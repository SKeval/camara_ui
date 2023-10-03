import 'package:camara_ui/UIs/Camera/camera_file.dart';
import 'package:camara_ui/UIs/Scan/Parts/scanner.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Widgets/bottom_sheet.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Bottom_Screen extends StatefulWidget {
  const Bottom_Screen(
      {super.key, this.cameraController, required this.changeCamera});
  final CameraController? cameraController;
  final Future<void> Function({required bool frontcamera}) changeCamera;
  @override
  State<Bottom_Screen> createState() => _Bottom_ScreenState();
}

class _Bottom_ScreenState extends State<Bottom_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 65,
            child: Row(
              children: [
                //Scanner
                SizedBox(
                  height: 50,
                  width: 50,
                  child: button(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Scanner(changeCamera: widget.changeCamera)));
                      },
                      color: Colors.white,
                      image: Image.asset(
                        scanner,
                        height: 50,
                        width: 50,
                      )),
                ),

                SizedBox(
                  width: 10,
                ),

                //click
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Camera_File(),
                    ));
                  },
                  /*async {
                    if (!widget.cameraController!.value.isInitialized) {
                      return null;
                    }
                    if (widget.cameraController!.value.isTakingPicture) {
                      return null;
                    }
                    try {
                      await widget.cameraController!
                          .setFlashMode(FlashMode.auto);
                      XFile file = await widget.cameraController!.takePicture();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Camera_File(file),
                      ));
                    } catch (e) {}
                  },*/
                  child: Image.asset(
                    cameraClick,
                    height: 80,
                    width: 80,
                  ),
                ),

                SizedBox(
                  width: 10,
                ),

                //fliters
                SizedBox(
                  height: 50,
                  width: 50,
                  child: button(
                      color: Colors.white,
                      image: Image.asset(
                        filter,
                        height: 50,
                        width: 50,
                      )),
                ),
              ],
            )),
      ],
    );
  }
}
