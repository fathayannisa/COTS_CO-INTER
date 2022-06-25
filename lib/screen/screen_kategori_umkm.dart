import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/maps_utils.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screen_daftar_umkm.dart';
import 'package:http/http.dart' as http;

class KategoriUMKMPage extends StatefulWidget {
  const KategoriUMKMPage({Key? key}) : super(key: key);

  @override
  _KategoriUMKMPageState createState() => _KategoriUMKMPageState();
}

TextEditingController searchBarController = TextEditingController();
String apiUrl = MyUrl().getUrl() + "/api/umkm";

class _KategoriUMKMPageState extends State<KategoriUMKMPage> {
  String idJenisMaster = "Terpopuler";

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

  Future<List<dynamic>> fecthData() async {
    apiUrl = MyUrl().getUrl() + "/api/umkm/" + idJenisMaster;
    if (searchBarController.text != "") {
      apiUrl = MyUrl().getUrl() +
          "/api/umkm/" +
          idJenisMaster +
          "/" +
          searchBarController.text;
    }
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  List<String> getLongLat(String data) {
    return data.split(",");
  }

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

  @override
  void initState() {
    super.initState();
    setState(() {
      setActivePage();
    });
    searchBarController.text = "";
    color1 = Colors.red.shade200;
    color11 = Colors.red;
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
        title: Text("UMKM"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 56,
                      child: TextField(
                        controller: searchBarController,
                        decoration: InputDecoration(
                          hintText: "Cari UMKM...",
                          hintStyle: const TextStyle(color: Color(0xffABABAB)),
                          filled: true,
                          fillColor: Color(0xffF6F6F6),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffFDFDFD)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: ((value) {
                          setState(() {
                            fecthData();
                          });
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Flex(direction: Axis.horizontal, children: <Widget>[
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
                                    "Terpopuler",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: color11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      idJenisMaster = "Terpopuler";
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
                                    "Makanan",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: color22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      idJenisMaster = "Makanan";
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
                                    "Jasa",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: color33,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      idJenisMaster = "Jasa";
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
                                    "Kerajinan",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: color44,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      idJenisMaster = "Kerajinan";
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
                                    "Fashion",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: color55,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      idJenisMaster = "Fashion";
                                      setActivePage();
                                      color5 = Colors.red.shade200;
                                      color55 = Colors.red;
                                    });
                                  },
                                ),
                              ),
                            ]),
                          ]),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 500,
                          child: FutureBuilder<List<dynamic>>(
                            future: fecthData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  itemCount: snapshot.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: 280,
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.network(
                                                  snapshot.data![index]
                                                      ['image'],
                                                  height: 150,
                                                  width: double.infinity,
                                                  fit: BoxFit.fitWidth,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  child: Column(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            snapshot.data![
                                                                index]['nama'],
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 6,
                                                          ),
                                                          Text(
                                                            snapshot.data![
                                                                    index]
                                                                ['deskripsi'],
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Flex(
                                                                direction: Axis
                                                                    .horizontal,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: <
                                                                    Widget>[
                                                                  GestureDetector(
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff98D3E6),
                                                                          borderRadius:
                                                                              BorderRadius.all((Radius.circular(8)))),
                                                                      child:
                                                                          Text(
                                                                        "Open Maps",
                                                                        style: GoogleFonts.montserrat(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    onTap:
                                                                        () async {
                                                                      double
                                                                          long =
                                                                          double.parse(
                                                                              getLongLat(snapshot.data![index]['maps']).first);
                                                                      double
                                                                          lat =
                                                                          double.parse(
                                                                              getLongLat(snapshot.data![index]['maps']).last);

                                                                      MapUtils.openMap(
                                                                          long,
                                                                          lat);
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text("Masih ada yang belum diisi"),
                                                                          duration:
                                                                              const Duration(milliseconds: 1000),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                  GestureDetector(
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff98D3E6),
                                                                          borderRadius:
                                                                              BorderRadius.all((Radius.circular(8)))),
                                                                      child:
                                                                          Text(
                                                                        "Detail",
                                                                        style: GoogleFonts.montserrat(
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    onTap: () {
                                                                      showModal(
                                                                          context,
                                                                          snapshot.data![index]
                                                                              [
                                                                              'nama'],
                                                                          snapshot.data![index]
                                                                              [
                                                                              'deskripsi'],
                                                                          snapshot.data![index]
                                                                              [
                                                                              'alamat'],
                                                                          snapshot.data![index]
                                                                              [
                                                                              'kategori'],
                                                                          snapshot.data![index]
                                                                              [
                                                                              'image'],
                                                                          snapshot.data![index]
                                                                              [
                                                                              'maps']);
                                                                    },
                                                                  ),
                                                                  Container(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10,
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5),
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xff98D3E6),
                                                                        borderRadius:
                                                                            BorderRadius.all((Radius.circular(8)))),
                                                                    child: Text(
                                                                      "Harga",
                                                                      style: GoogleFonts.montserrat(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                );
                              } else {
                                return const Center(
                                    child: Text('Data Kunjungan Belum Ada'));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff98d3e6),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DaftarUMKMPage()),
                      );
                    }),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'image/tambahform.png',
                        width: 62,
                        height: 62,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text("UMKM"),
    leading: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 25,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ),
  );
}

void showModal(BuildContext context, String nama, String deskripsi,
    String alamat, String kategori, String image, String maps) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(
        nama,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Deskripsi: " + deskripsi,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Alamat: " + alamat,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Kategori: " + kategori,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Maps: " + maps,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Tutup Halaman'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
