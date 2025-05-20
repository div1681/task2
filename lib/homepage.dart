import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safe_password_generator/safe_password_generator.dart';
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
  bool pressed = false;
  String password = "";
  bool show = false;

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
                onPressed: () {
                  password = SafePasswordGenerator.generatePassword(
                      length: password_length.toInt(),
                      includeUppercase: up,
                      includeLowercase: low,
                      includeNumbers: num,
                      includeSpecialCharacters: sym);
                  setState(() {
                    password = password;
                  });
                },
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
                onPressed: () {
                  password = SafePasswordGenerator.generatePassword(
                      length: password_length.toInt(),
                      includeUppercase: up,
                      includeLowercase: low,
                      includeNumbers: num,
                      includeSpecialCharacters: sym);
                  setState(() {
                    password = password;
                    show = false;
                  });
                },
                child: const Text(
                  "Generate Password",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFFD6E8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    //eye
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: AnimatedContainer(
                      //margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(4),
                      duration: Duration(milliseconds: 250),
                      height: 50,
                      width: 50,
                      child: Icon(
                        show ? Icons.visibility : Icons.visibility_off,
                        color: show ? Color(0xFFD0F0C0) : Color(0xFFFFD6E8),
                      ),
                      // child: Image.asset(
                      //   'assets/copy.png',
                      //   height: 16,
                      //   width: 16,
                      //   color: pressed ? Color(0xFFD0F0C0) : Color(0xFFFFD6E8),
                      // ),
                      decoration: BoxDecoration(
                        color: Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: show ? Color(0xFF3E3E3E) : Color(0xFF2B2B2B),
                        ),
                        boxShadow: show
                            ? []
                            : [
                                BoxShadow(
                                  color: Color(0xFF1C1C1C),
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                ),
                                BoxShadow(
                                  color: Color(0xFF3A3A3A),
                                  offset: Offset(-4, -4),
                                  blurRadius: 6,
                                ),
                              ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      show ? password : "*" * password.length,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFFD0F0C0),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (password != null) {
                        Clipboard.setData(ClipboardData(text: password));
                      }
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    child: AnimatedContainer(
                      //margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(10),
                      duration: Duration(milliseconds: 250),
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'assets/copy.png',
                        height: 12,
                        width: 12,
                        color: pressed ? Color(0xFFD0F0C0) : Color(0xFFFFD6E8),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF2B2B2B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              pressed ? Color(0xFF3E3E3E) : Color(0xFF2B2B2B),
                        ),
                        boxShadow: pressed
                            ? []
                            : [
                                BoxShadow(
                                  color: Color(0xFF1C1C1C),
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                ),
                                BoxShadow(
                                  color: Color(0xFF3A3A3A),
                                  offset: Offset(-4, -4),
                                  blurRadius: 6,
                                ),
                              ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
