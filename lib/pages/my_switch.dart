import 'package:flutter/material.dart';

import 'package:switch_button/models/switch_model.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  
  @override
  void update(value) {
    bool x = false;
    setState(() {
      x = value;
    });
  }

  static List<SwitchModel> main_tiles = [
    SwitchModel(
      'Bluetooth',
      'Not visible to other devices',
      til: Switch(
        onChanged: (value) {},
        value: false,
      ),
    ),
    SwitchModel(
      'Cast',
      'Not connected',
    ),
    SwitchModel(
      'NFC',
      'Allow data exchange when the phone \ntouches another device',
      til: Switch(
        onChanged: (value) {},
        value: true,
      ),
    ),
    SwitchModel(
      'Android Beam',
      'Unavailable because NFC is turned off',
    ),
    SwitchModel(
      'USB',
      'Not connected',
    ),
    SwitchModel(
      'Printing',
      '2 print services on',
    ),
  ];

  List<SwitchModel> tile_length = List.from(main_tiles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Connected devices'),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications),
          SizedBox(
            width: 14,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tile_length.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 35.0, bottom: 5),
                    child: ListTile(
                      title: Text(tile_length[i].title!),
                      subtitle: Text(tile_length[i].subtitle!),
                      trailing: tile_length[i].til,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
