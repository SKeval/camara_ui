import 'package:camara_ui/Utils/colors.dart';
import 'package:flutter/material.dart';

Widget button(
    {IconData? icon,
    Image? image,
    void Function()? onPressed,
    Color? color,
    Color? bgcolor}) {
  return FloatingActionButton.small(
    
      backgroundColor: bgcolor ?? Colors.white,
      onPressed: onPressed,
      child: image == null
          ? Icon(
              icon,
              color: color == null ? bgcolor : color,
            )
          : image);
}
