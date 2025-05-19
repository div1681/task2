import 'package:flutter/material.dart';
import 'package:task2/switch.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double password_length = 8;
  bool up = false;
  bool low = false;
  bool num = false;
  bool sym = false;

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
            ),
            SizedBox(
              height: 20,
            ),
            myswitch(
                ON: up,
                title: "Include uppercase letters.",
                change: (ON) {
                  setState(() {
                    up = ON;
                  });
                }),
            myswitch(
                ON: low,
                title: "Include lowercase letters.",
                change: (ON) {
                  setState(() {
                    low = ON;
                  });
                }),
            myswitch(
                ON: num,
                title: "Include numbers.",
                change: (ON) {
                  setState(() {
                    num = ON;
                  });
                }),
            myswitch(
                ON: sym,
                title: "Include special characters.",
                change: (ON) {
                  setState(() {
                    sym = ON;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD6E8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {},
                child: const Text("Generate Password",
                    style: TextStyle(fontSize: 18, color: Color(0xFF2B2B2B))),
              ),
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFFFFD6E8), width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Generate Password",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFD6E8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
