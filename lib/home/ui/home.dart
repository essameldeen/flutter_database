import 'package:flutter/material.dart';
import 'package:flutter_database/shared%20Prefernces/ui/shared.dart';
import 'package:flutter_database/utils/colors.dart';
import 'package:flutter_database/utils/common.dart';
import 'package:flutter_database/utils/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter DataBase"),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: button("Share Preference", () {
              route(context, const SharedHome());
            }),
          )
        ],
      ),
    );
  }
}
