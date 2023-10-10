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
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          button(
                            image: Image.asset(
                              close,
                              scale: 3,
                            ),
                            bgcolor: Color(0xaaEBEBEB),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Container(
                            width: width / 1.6,
                            height: width / 9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xaaEBEBEB),
                            ),
                            child: Center(
                              child: text('XRpresso',
                                  size: 25,
                                  weight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          button(
                            image: Image.asset(search),
                            bgcolor: Color(0xaaEBEBEB),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 70,
                      child: Container(
                        width: width / 8,
                        decoration: BoxDecoration(
                            color: Color(0xaaEBEBEB),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            button(
                                image: Image.asset(firelight),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(message),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(heart),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(face),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(rangoli),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(baloon),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(temple),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(beach),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(cart),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(food),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(fair),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(star),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(hand),
                                bgcolor: Colors.white),
                            button(
                                image: Image.asset(yoga),
                                bgcolor: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
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
