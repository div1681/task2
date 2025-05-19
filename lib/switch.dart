import 'package:flutter/material.dart';

class myswitch extends StatelessWidget {
  final bool ON;
  final String title;
  final ValueChanged<bool> change;

  const myswitch(
      {required this.ON, required this.title, required this.change, super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Color(0xFFD0F0C0),
      activeTrackColor: Color(0xFF3E3E3E),
      inactiveThumbColor: Color(0xFFFFD6E8),
      inactiveTrackColor: Color(0xFF2B2B2B),
      value: ON,
      title: Text(
        title,
        style: TextStyle(
            color: ON ? Color(0xFFD0F0C0) : Color(0xFFFFD6E8), fontSize: 16),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: change,
    );
  }
}
