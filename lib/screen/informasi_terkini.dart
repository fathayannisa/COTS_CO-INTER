import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class InformasiTerkiniPage extends StatefulWidget {
  const InformasiTerkiniPage({Key? key}) : super(key: key);

  @override
  _InformasiTerkiniPageState createState() => _InformasiTerkiniPageState();
}

String idJenisMaster = "1";
Color color1 = Colors.transparent;
Color color2 = Colors.transparent;
Color color3 = Colors.transparent;
Color color4 = Colors.transparent;
Color color5 = Colors.transparent;

Color color11 = Colors.black;
Color color22 = Colors.black;
Color color33 = Colors.black;
Color color44 = Colors.black;
Color color55 = Colors.black;

void setActivePage() {
  color1 = Colors.transparent;
  color2 = Colors.transparent;
  color3 = Colors.transparent;
  color4 = Colors.transparent;
  color5 = Colors.transparent;

  color11 = Colors.black;
  color22 = Colors.black;
  color33 = Colors.black;
  color44 = Colors.black;
  color55 = Colors.black;
}

class _InformasiTerkiniPageState extends State<InformasiTerkiniPage> {
  Future<List<dynamic>> fecthData(String? idJenis) async {
    if (idJenis == "") idJenis = "1";
    String apiUrl = MyUrl().getUrl() + "/api/informasi/" + idJenis.toString();

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      setActivePage();
    });
    color1 = Colors.red;
    color11 = Colors.red.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Informasi Terkini"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: color1,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Terbaru",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: color11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              idJenisMaster = "1";
                              setActivePage();
                              color1 = Colors.red.shade200;
                              color11 = Colors.red;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: color2,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Umum",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: color22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              idJenisMaster = "2";
                              setActivePage();
                              color2 = Colors.red.shade200;
                              color22 = Colors.red;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: color3,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Kesehatan",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: color33,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              idJenisMaster = "3";
                              setActivePage();
                              color3 = Colors.red.shade200;
                              color33 = Colors.red;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: color4,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Regional",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: color44,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              idJenisMaster = "4";
                              setActivePage();
                              color4 = Colors.red.shade200;
                              color44 = Colors.red;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          color: color5,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GestureDetector(
                          child: Text(
                            "Lingkungan",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: color55,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              idJenisMaster = "5";
                              setActivePage();
                              color5 = Colors.red.shade200;
                              color55 = Colors.red;
                            });
                            print(idJenisMaster);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  height: 230,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "image/info1.png",
                          height: 150,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vaksin Covid-19 sudah masuk ke daerah X",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 160,
                  height: 230,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "image/info2.png",
                          height: 150,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penutupan jalur untuk meminimalisir arus mudik",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 150,
              child: FutureBuilder<List<dynamic>>(
                future: fecthData(idJenisMaster),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data![index]['title'],
                                      style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data![index]['context'],
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(229, 229, 229, 80),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    );
                  } else {
                    return const Center(
                      child: Text('Data Informasi Terkini Belum Ada'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
