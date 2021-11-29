import 'package:flutter/material.dart';

void route(BuildContext context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {return page;}));