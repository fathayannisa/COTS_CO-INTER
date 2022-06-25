import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen_forgot_password.dart';
import 'screen_dashboard.dart';
import 'package:http/http.dart' as http;

final nimController = TextEditingController();
final passwordController = TextEditingController();
late SharedPreferences logindata;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                                controller: nimController,
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
                                  hintText: "NIM",
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Stack(
                          children: [
                            Container(
                              child: TextField(
                                controller: passwordController,
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
                                  hintText: "Password",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return forgotPassword();
                          }));
                        },
                        child: Padding(
                          child: Text("Forgot Password ?"),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 40,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Color.fromARGB(255, 16, 158, 201),
                          ),
                          onPressed: () async {
                            String url = MyUrl().getUrl();
                            String nim = nimController.text;
                            String password = passwordController.text;

                            var response =
                                await http.get(Uri.parse("$url/api/user/$nim"));
                            var decodedData = jsonDecode(response.body);
                            // cek textField kosong
                            if (nim == "" || password == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Nim atau password masih kosong"),
                                  duration: const Duration(milliseconds: 1000),
                                ),
                              );
                            } else {
                              // cek user terdaftar
                              if (decodedData['success'] == false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("User tidak terdaftar"),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                  ),
                                );
                              } else {
                                // cek password bener
                                if (decodedData['data']['password'] ==
                                    password) {
                                  logindata =
                                      await SharedPreferences.getInstance();
                                  logindata.setString(
                                      'nama', decodedData['data']['nama']);
                                  showModalSukses(
                                      context, decodedData['data']['nama']);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Password salah, silakan masukan password yang benar"),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
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

  void showModalSukses(BuildContext context, String nama) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Sukses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Selamat datang $nama, \nAnda Berhasil Login !!")
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Iya'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
