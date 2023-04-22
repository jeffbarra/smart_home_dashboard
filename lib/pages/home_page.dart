import 'package:flutter/material.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath, powerStatus ]
    ["Smart Light", 'lib/icons/lightbulb.png', true],
    ["Smart A/C", 'lib/icons/air.png', false],
    ["Smart Fan", 'lib/icons/fan.png', false],
    ["Smart TV", 'lib/icons/smart-tv.png', true],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // custom app bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // menu icon
                    Image.asset(
                      'lib/icons/menu.png',
                      height: 45,
                      color: Colors.grey[800],
                    ),

                    // account icon
                    Icon(Icons.person, size: 45, color: Colors.grey[800]),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // welcome home
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Welcome Home,"),
                    Text("Jeff Barra", style: TextStyle(fontSize: 40)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                ),
              ),

              // smart devices grid
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Text('Smart Devices'),
              ),

              Expanded(
                  child: GridView.builder(
                      itemCount: mySmartDevices.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(25.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return SmartDeviceBox(
                          smartDeviceName: mySmartDevices[index][0],
                          iconPath: mySmartDevices[index][1],
                          powerOn: mySmartDevices[index][2],
                          onChanged: (value) =>
                              powerSwitchChanged(value, index),
                        );
                      }))
            ],
          ),
        ));
  }
}
