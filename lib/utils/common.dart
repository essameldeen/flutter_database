import 'package:flutter/material.dart';
import 'package:flutter_database/utils/colors.dart';

Widget close(BuildContext context) => IconButton(
      icon: const Icon(
        Icons.close,
        color: backgroundColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

Widget button(String label, Function() action) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: double.maxFinite,
      ),
      child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.w800),
            ),
          )),
    ),
  );
}

Widget coloredButton(String label, Color? color, Function() action) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: double.maxFinite,
      ),
      child: ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            primary: color ?? primaryColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: backgroundColor,
                  fontSize: 15,
                  fontFamily: "Comfortaa",
                  fontWeight: FontWeight.w800),
            ),
          )),
    ),
  );
}

Widget text(
    {required String text,
    double size = 17,
    Color? color,
    bool bold = true,
    align = TextAlign.start}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontFamily: "Comfortaa",
        color: color ?? primaryColor,
        fontWeight: bold ? FontWeight.w900 : FontWeight.w700),
  );
}

Widget textWithIcon(
    {required IconData icon,
    required String value,
    double size = 17,
    Color? color,
    bool bold = true,
    align = TextAlign.start}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Icon(
          icon,
          color: color ?? primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        text(text: value, size: size, color: color, bold: bold, align: align),
      ],
    ),
  );
}

Widget baseInput(String hint, TextEditingController controller,
    Function(String) changeListener) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    child: TextField(
      style: const TextStyle(
        color: primaryColor,
        fontFamily: "Comfortaa",
      ),
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          gapPadding: 10,
        ),
      ),
      onChanged: changeListener,
      controller: controller,
    ),
  );
}

Widget input(IconData icon, String hint, TextInputType type, bool secure,
    Function(String) changeListener) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: TextField(
      style: const TextStyle(
        color: primaryColor,
        fontFamily: "Comfortaa",
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: Icon(icon),
        alignLabelWithHint: true,
        labelText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 10,
        ),
      ),
      keyboardType: type,
      obscureText: secure,
      onChanged: changeListener,
    ),
  );
}

Widget inputArea(String hint, Function(String) changeListener) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
    child: TextField(
      style: const TextStyle(
        color: primaryColor,
        fontFamily: "Comfortaa",
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: true,
        labelText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gapPadding: 10,
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 7,
      onChanged: changeListener,
    ),
  );
}

void loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return Center(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          ),
        );
      });
}
