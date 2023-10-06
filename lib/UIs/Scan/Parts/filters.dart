// ignore_for_file: camel_case_types

import 'package:camara_ui/Utils/colors.dart';
import 'package:camara_ui/Utils/images.dart';
import 'package:camara_ui/Utils/text.dart';
import 'package:camara_ui/Widgets/button.dart';
import 'package:flutter/material.dart';

class Filters_Page extends StatefulWidget {
  const Filters_Page({super.key});

  @override
  State<Filters_Page> createState() => _Filters_PageState();
}

class _Filters_PageState extends State<Filters_Page> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height / 1.038,
              decoration: BoxDecoration(
                color: Background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          button(
                            image: Image.asset(
                              close,
                              scale: 3,
                            ),
                            bgcolor: grey,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          text('XRpresso',
                              size: 25,
                              weight: FontWeight.bold,
                              color: Common_white),
                          button(image: Image.asset(search), bgcolor: grey),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: Container(
                        width: width / 8,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            button(image: Image.asset(firelight)),
                            button(image: Image.asset(message)),
                            button(image: Image.asset(heart)),
                            button(image: Image.asset(face)),
                            button(image: Image.asset(rangoli)),
                            button(image: Image.asset(baloon)),
                            button(image: Image.asset(temple)),
                            button(image: Image.asset(beach)),
                            button(image: Image.asset(cart)),
                            button(image: Image.asset(food)),
                            button(image: Image.asset(fair)),
                            button(image: Image.asset(star)),
                            button(image: Image.asset(hand)),
                            button(image: Image.asset(yoga)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      right: 0,
                      child: SizedBox(
                        height: height,
                        width: width / 1.25,
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: box_color,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  text("Rangoli Painting",
                                      color: Background, size: 15),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
