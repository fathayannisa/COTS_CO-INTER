import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen_forum_detail.dart';

class PembukuanKasPage extends StatefulWidget {
  @override
  _PembukuanKasPageState createState() => _PembukuanKasPageState();
}

class _PembukuanKasPageState extends State<PembukuanKasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pembukuan Kas"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Laporan Keuangan",
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Image.asset(
              "image/Lapkeu.png",
            ),
          ],
        ),
      ),
    );
  }
}
