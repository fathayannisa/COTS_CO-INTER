import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/screen/screen_login.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ForumDetail extends StatefulWidget {
  final String title;
  final String id;
  const ForumDetail({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  _ForumDetailState createState() => _ForumDetailState();
}

final msgController = TextEditingController();

class _ForumDetailState extends State<ForumDetail> {
  Future insert() async {
    await http.post(
      Uri.parse(MyUrl().getUrl() + "/api/pesanforum"),
      body: {
        "nama": logindata.getString("nama"),
        "pesan": msgController.text,
        "status": "Active",
        "id_forum": widget.id,
      },
    );
  }

  Future<List<dynamic>> fecthData() async {
    String apiUrl = MyUrl().getUrl() + "/api/forum/" + widget.id;
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  Widget jadwal() {
    if (widget.title == "Pos Ronda") {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Jadwal Jaga",
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kumpulanJadwal[0],
                kumpulanJadwal[1],
                kumpulanJadwal[2],
                kumpulanJadwal[3],
                kumpulanJadwal[4],
              ],
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 153, 208, 233))),
      );
    }
    return SizedBox.shrink();
  }

  List<Column> kumpulanJadwal = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Senin",
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "Bpk. Amin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Joko",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Rizky",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Udin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selasa",
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "Bpk. Amin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Joko",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Rizky",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Udin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rabu",
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "Bpk. Amin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Joko",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Rizky",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Udin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kamis",
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "Bpk. Amin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Joko",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Rizky",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Udin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jumat",
          style:
              GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          "Bpk. Amin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Joko",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Rizky",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
        Text(
          "Bpk. Udin",
          style: GoogleFonts.montserrat(
              fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forum"),
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
        child: Stack(children: [
          ListView(
            children: [
              Text(
                "Forum : " + widget.title,
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              jadwal(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 350,
                child: FutureBuilder<List<dynamic>>(
                  future: fecthData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(110, 0, 0, 0)),
                                color: Color.fromARGB(117, 219, 219, 219)),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("image/profile.png"),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index]['nama'],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data![index]['pesan'],
                                        style: GoogleFonts.montserrat(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      );
                    } else {
                      return const Center(
                        child: Text('Data Forum Belum Ada'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 290,
                    child: TextField(
                      controller: msgController,
                      style: GoogleFonts.montserrat(fontSize: 14),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Color.fromARGB(255, 234, 234, 234),
                        filled: true,
                        hintText: 'Masukan Pesan',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (msgController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Pesan masih kosong"),
                            duration: const Duration(milliseconds: 1000),
                          ),
                        );
                      } else {
                        setState(() {
                          insert();
                          msgController.text = "";
                        });
                      }
                    },
                    child: Image.asset("image/pesawatkertas.png"),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

AppBar buildAppbar() {
  return AppBar(
      centerTitle: true,
      title: Text("Forum"),
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ));
}
