import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 40.0;

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
                Icon(
                  Icons.now_widgets_rounded,
                  size: 45,
                  color: Colors.grey[800],
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
                  'KEMILY',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
