import 'package:flutter/material.dart';
import 'package:truebiller/utils/size_utils.dart';

import '../../../constants/constants.dart';

class LoadButton extends StatelessWidget {
  final Function onTap;
  const LoadButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          onTap;
        },
        child: Container(
          height: 30.fSize,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: buttonGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(padding),
            boxShadow: shadows,
          ),
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(
                fontSize: 12.fSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
