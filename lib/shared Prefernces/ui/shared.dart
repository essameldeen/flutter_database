import 'package:flutter/material.dart';
import 'package:flutter_database/shared%20Prefernces/ui/setting.dart';
import 'package:flutter_database/utils/colors.dart';
import 'package:flutter_database/utils/router.dart';

class SharedHome extends StatelessWidget {
  const SharedHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences"),
        backgroundColor: backgroundColor,
        actions: [
          IconButton(onPressed: () {
            route(context, const SettingScreen());
          }, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
