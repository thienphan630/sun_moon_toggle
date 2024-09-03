import 'package:flutter/material.dart';
import 'package:sun_moon_toggle/sun_moon_toggle.dart/sun_moon_toogle.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SunMoonToggle(
          value: switchValue,
          onToggle: (value) {
            setState(() {
              switchValue = !switchValue;
            });
          },
        ),
      ),
    );
  }
}
