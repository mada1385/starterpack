import 'package:flutter/material.dart';
import 'package:starterpack/core/config/mediaqueryconfig.dart';

class Relativecontainer extends StatelessWidget {
  Relativecontainer(this.width, this.height,
      {this.color = Colors.transparent, this.child, this.shadow = false});
  final double height, width;
  final Color color;
  final Widget child;
  final bool shadow;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      decoration: BoxDecoration(
          color: color,
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2))
                ]
              : []),
      width: config.widthr(width, context),
      height: config.hieghtr(height, context),
      child: child ?? null,
    );
  }
}

class OnlywidthRelativecontainer extends StatelessWidget {
  OnlywidthRelativecontainer(this.width,
      {this.color = Colors.transparent, this.child});
  final double width;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      width: config.widthr(width, context),
      color: color,
      child: child ?? null,
    );
  }
}

class OnlyhightRelativecontainer extends StatelessWidget {
  OnlyhightRelativecontainer(this.height,
      {this.color = Colors.transparent, this.child});
  final double height;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return Container(
      height: config.hieghtr(height, context),
      color: color,
      child: child ?? null,
    );
  }
}
