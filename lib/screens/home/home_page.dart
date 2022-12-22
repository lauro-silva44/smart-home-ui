import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.person,
                size: 35,
                color: Colors.grey[800],
              ),
            ],
          ),
          backgroundColor: Colors.grey[50],
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context) {
            return Material(
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/menu-2.svg',
                  color: Colors.grey[800],
                  height: 24,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          })),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'My Smart Home',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.on_device_training),
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
