/*
 * @desc [class that will hold most of the reusable UI components and operators like textStyles and Dialogs]
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UI {
  static Future<dynamic> push(BuildContext context, Widget page,
      {bool replace = false, int delay}) async {
    if (delay != null)
      await Future.delayed(Duration(milliseconds: delay), () {});
    final route = MaterialPageRoute(builder: (c) => page);

    return replace
        ? await Navigator.pushReplacement(context, route)
        : await Navigator.push(context, route);
  }

  static Future<dynamic> pushReplaceAll(BuildContext context, Widget page,
      {int delay}) async {
    if (delay != null)
      await Future.delayed(Duration(milliseconds: delay), () {});
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> dialog(
      {BuildContext context,
      bool dismissible = true,
      Widget child,
      bool accept,
      String title,
      String msg,
      String acceptMsg,
      String cancelMsg}) async {
    return await showDialog<dynamic>(
        context: context,
        barrierDismissible: dismissible,
        builder: (context) {
          return Dialog(
            child: child != null
                ? child
                : Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        if (child != null) child,
                        if (title != null)
                          Text(title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        if (msg != null)
                          Text(msg,
                              maxLines: 2, style: TextStyle(fontSize: 12)),
                        SizedBox(height: 5),
                        if (accept != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(
                                  cancelMsg,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  acceptMsg,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
          );
        });
  }

  static unfocus(context) {
    FocusScope.of(context).unfocus();
  }

  static toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 15.0,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey[700],
    );
  }

  static showInSnackBar(GlobalKey<ScaffoldState> scaffoldKey, Widget child) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(content: child));
  }
}
