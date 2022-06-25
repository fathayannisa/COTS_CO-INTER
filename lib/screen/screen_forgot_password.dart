import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen_login.dart';

class forgotPassword extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.08,
            bottom: MediaQuery.of(context).size.height * 0.08),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  "CO-INTER",
                  style: GoogleFonts.roboto(
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(23, 138, 174, 1)),
                ),
                Text(
                  "Community Information Center",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(23, 138, 174, 1)),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "image/GambarLogin.png",
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 300,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.09)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 20),
                        child: Stack(
                          children: [
                            Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 50, right: 35),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Email",
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 30,
                              height: 60,
                              width: 10,
                              child: Container(
                                  color: Color.fromRGBO(23, 138, 174, 1)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: TextButton(
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 16, 158, 201)),
                            onPressed: () {},
                            child: Text(
                              "Kirim Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
