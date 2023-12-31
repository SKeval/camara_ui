// ignore: unused_import
import 'package:camara_ui/Utils/colors.dart';
import 'package:flutter/material.dart';

Widget button(
    {IconData? icon,
    Image? image,
    void Function()? onPressed,
    Color? color,
    Color? bgcolor}) {
  return FloatingActionButton.small(
      heroTag: null,
      backgroundColor: bgcolor ?? const Color.fromARGB(100, 255, 255, 255),
      onPressed: onPressed,
      child: image ??
          Icon(
            icon,
            color: color ?? bgcolor,
          ));
}
