import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:starterpack/UI/maincomponents/relativewidgets.dart';
import 'package:starterpack/core/config/mediaqueryconfig.dart';

import 'customtext.dart';

class Backbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = SizeConfig();
    config.init(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          Icon(PhosphorIcons.caret_left),
          SizedBox(
            height: config.widthr(8, context),
          ),
          OnlywidthRelativecontainer(190,
              child: Customtext(
                "Back",
                color: Colors.black,
                size: 14,
              )),
        ],
      ),
    );
  }
}
