import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double password_length = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B),
      //green: Color(0xFFD0F0C0)
      //black: Color(0xFF2B2B2B)
      //pink: Color(0xFFFFD6E8)
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD6E8),
        centerTitle: true,
        title: Text(
          'P A S S  W O R D',
          style: TextStyle(color: Color(0xFF2B2B2B), fontSize: 32),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Choose the length of password : ",
              style: TextStyle(color: Color(0xFFFFD6E8), fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                    value: password_length,
                    min: 8,
                    max: 32,
                    divisions: 24,
                    //label: password_length.toString(),

                    activeColor: Color(0xFFFFD6E8),
                    inactiveColor: Color(0xFFFFD6EE),
                    onChanged: (value) {
                      setState(() {
                        password_length = value;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text(
                  password_length.toInt().toString(),
                  style: TextStyle(fontSize: 24, color: Color(0xFFD0F0C0)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
