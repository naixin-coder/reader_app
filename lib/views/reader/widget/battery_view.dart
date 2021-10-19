/*
 * @Author: 刘林
 * @Date: 2021-10-12 16:59:23
 * @LastEditors: 刘林
 * @LastEditTime: 2021-10-12 17:05:59
 */

import 'dart:io';

import 'package:battery/battery.dart';
import 'package:reader_app/views/reader/widget/reader_icons.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class BatteryView extends StatefulWidget {
  const BatteryView({Key? key}) : super(key: key);

  @override
  _BatteryViewState createState() => _BatteryViewState();
}

class _BatteryViewState extends State<BatteryView> {
  double batteryLevel = 0;

  @override
  void initState() {
    super.initState();

    getBatteryLevel();
  }

  getBatteryLevel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      if (!androidInfo.isPhysicalDevice) {
        return;
      }
    }
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      if (!iosInfo.isPhysicalDevice) {
        return;
      }
    }

    var level = await Battery().batteryLevel;
    setState(() {
      batteryLevel = level / 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      height: 12,
      child: Stack(
        children: <Widget>[
          battery,
          Container(
            margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
            width: 20 * batteryLevel,
            color: Colors.black45,
          )
        ],
      ),
    );
  }
}
