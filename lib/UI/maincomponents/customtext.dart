import 'package:flutter/material.dart';
import 'package:starterpack/core/config/colors.dart';

class Customtext extends StatelessWidget {
  const Customtext(this.text,
      {this.size = 16,
      this.fontWeight = FontWeight.w500,
      this.color = maincolor,
      this.onelined = false});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool onelined;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: size,
              fontFamily: "inter",
              fontWeight: fontWeight,
            ),
          )),
    );
  }
}

class Customnormaltext extends StatelessWidget {
  const Customnormaltext(this.text,
      {this.size = 16,
      this.fontWeight = FontWeight.w500,
      this.color = maincolor,
      this.onelined = false});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool onelined;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: "inter",
            fontWeight: fontWeight,
          ),
        ));
  }
}
