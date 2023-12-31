// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Utils/text.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camera_File extends StatefulWidget {
  const Camera_File({super.key, required this.file});
  final XFile file;

  @override
  State<Camera_File> createState() => _Camera_FileState();
}

class _Camera_FileState extends State<Camera_File> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),

          //image
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 1.05,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    color: Colors.white),
                child: Image.file(
                  picture,
                  fit: BoxFit.fill,
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: height / 10,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 28, 39, 76)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            add_story,
                            height: 35,
                            width: 35,
                          ),
                          text("Add Story", weight: FontWeight.w700, size: 16)
                        ],
                      ),
                    ),
                    Container(
                      width: width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 28, 39, 76)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 35,
                            width: 35,
                            share,
                          ),
                          text("Send", weight: FontWeight.bold, size: 16)
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: height / 15,
              left: 15,
              child: button(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                image: Image.asset(
                  close,
                  height: 25,
                  width: 25,
                ),
                color: Colors.black,
                bgcolor: const Color.fromARGB(255, 94, 89, 89),
              )),
          Positioned(
              top: height / 15,
              right: 15,
              child: button(
                image: Image.asset(
                  save,
                  height: 25,
                  width: 25,
                ),
                bgcolor: const Color.fromARGB(255, 94, 89, 89),
              )),
        ],
      ),
    );
  }
}
