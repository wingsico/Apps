import 'package:flutter/material.dart';

class SwitchAndCheckbox extends StatefulWidget {
  @override
  _SwicthAndCheckboxState createState() => _SwicthAndCheckboxState();
}

class _SwicthAndCheckboxState extends State<SwitchAndCheckbox> {
  bool _switchSelected = true;
  bool _checkboxSelected = false;

  @override
  build(BuildContext ctx) {
    return Column(
      children: [
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.green,
          tristate: true,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}
