// ignore_for_file: camel_case_types

import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Utils/text.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:flutter/material.dart';

class Gallery_Screen extends StatefulWidget {
  const Gallery_Screen({super.key});

  @override
  State<Gallery_Screen> createState() => _Gallery_ScreenState();
}

class _Gallery_ScreenState extends State<Gallery_Screen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: Container(
              height: height / 1.05,
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(gallery),
                          const SizedBox(
                            width: 5,
                          ),
                          text("Dairy", size: 20, color: Colors.black),
                        ],
                      ),
                    ),
                    Expanded(
                        child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 9 / 16,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            children: List<Widget>.generate(50, (index) {
                              return Container(
                                color: Sliver,
                              );
                            })))
                  ],
                ),
              ),
            )),
        Positioned(
          left: 15,
          top: 50,
          child: button(
            bgcolor: Color(0xaaEBEBEB),
            image: Image.asset(
              down,
              height: 25,
              width: 25,
              color: Colors.black,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
/*
GridView.extent(
                          maxCrossAxisExtent: 150,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List<Widget>.generate(50, (index) {
                            return Container(
                              color: Sliver,
                            );
                          })),









                          
*/