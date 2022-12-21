import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 40.0;

  List mySmartDevices = [
    ['Smart Light', 'assets/icons/light-bulb.svg', true],
    ['Smart AC', 'assets/icons/air-conditioner.svg', false],
    ['Smart TV', 'assets/icons/smart-tv.svg', false],
    ['Smart Fan', 'assets/icons/fan.svg', false],
  ];
  void powerSwitch(bool value, index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/menu-2.svg',
                  color: Colors.grey[800],
                  height: 30,
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Welcome Home,'),
                Text(
                  'Kemily Spínola',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: const Text('Smart Device'),
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: mySmartDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmartDeviceBox(
                            iconPath: mySmartDevices[index][1],
                            name: mySmartDevices[index][0],
                            powerOn: mySmartDevices[index][2],
                            onChanged: ((value) => powerSwitch(value, index))));
                  })))
        ],
      )),
    );
  }
}
