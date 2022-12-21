import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmartDeviceBox extends StatelessWidget {
  final String name, iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;

  const SmartDeviceBox(
      {super.key,
      required this.name,
      required this.onChanged,
      required this.iconPath,
      required this.powerOn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[200] : Colors.grey[900],
            borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 70,
              color: powerOn ? Colors.grey[900] : Colors.grey[200],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                              powerOn ? Colors.grey[900] : Colors.grey[200])),
                )),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    trackColor: Colors.grey[200],
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
