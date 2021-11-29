import 'package:flutter/material.dart';
import 'package:flutter_database/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedColor = Colors.green.value;
  late SharedPreferences _sharedPreferences;

  void saveDate(int color) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setInt("settings", color);
  }

  void setData() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      selectedColor =
          _sharedPreferences.getInt("settings") ?? Colors.white.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    setData();
    return Scaffold(
      backgroundColor: Color(selectedColor),
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          createRadioButton("Green", Colors.green),
          createRadioButton("Red", Colors.red),
          createRadioButton("Blue", Colors.blue),
        ],
      ),
    );
  }

  Widget createRadioButton(String title, Color color) {
    return RadioListTile(
        title: Text(title),
        value: color.value,
        groupValue: selectedColor,
        onChanged: (value) {
          setState(() {
            selectedColor = color.value;
          });
          saveDate(selectedColor);
        });

  }
}
