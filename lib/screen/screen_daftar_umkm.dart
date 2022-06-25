import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/screen/screen_dashboard.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DaftarUMKMPage extends StatefulWidget {
  @override
  _DaftarUMKMPageState createState() => _DaftarUMKMPageState();
}

class _DaftarUMKMPageState extends State<DaftarUMKMPage> {
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();
  final alamatController = TextEditingController();
  final gambarController = TextEditingController();
  final mapsController = TextEditingController();

  String kategoriVal = "Terpopuler";
  List kategoriList = [
    "Terpopuler",
    "Makanan",
    "Jasa",
    "Kerajinan",
    "Fashion",
  ];

  Future insert() async {
    await http.post(
      Uri.parse(MyUrl().getUrl() + "/api/umkm"),
      body: {
        "nama": namaController.text,
        "deskripsi": deskripsiController.text,
        "alamat": alamatController.text,
        "kategori": kategoriVal,
        "image": gambarController.text,
        "maps": mapsController.text
      },
    );
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
        title: Text("Pendaftaran UMKM"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 18,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 130,
                        decoration: const BoxDecoration(
                          color: Color(0xff98d3e6),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'image/tambahform.png',
                      width: 62,
                      height: 62,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Container(
                            width: 300,
                            height: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(24),
                                child: Text(
                                  "Form Pendaftaran",
                                  style: GoogleFonts.montserrat(fontSize: 24),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: const Color(0xff98d3e6),
                              ),
                              Container(
                                height: 400,
                                padding: const EdgeInsets.all(24),
                                child: ListView(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Nama usaha :",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                          controller: namaController,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Masukkan nama usaha ...",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffDAD9D9)),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF6F6F6),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xffF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xff98d3e6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Deskripsi usaha :",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                          controller: deskripsiController,
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Masukkan deskripsi usaha ...",
                                              hintStyle: const TextStyle(
                                                  color:
                                                      const Color(0xffDAD9D9)),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF6F6F6),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xffF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff98d3e6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Alamat :",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                          controller: alamatController,
                                          decoration: InputDecoration(
                                              hintText: "Masukkan alamat ...",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffDAD9D9)),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF6F6F6),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xffF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xff98d3e6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Kategori :",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          child: DropdownButton(
                                            isExpanded: true,
                                            underline: Container(
                                              height: 1,
                                              color: Colors.black12,
                                            ),
                                            hint: Text("Pilih Kategori"),
                                            value: kategoriVal,
                                            items: kategoriList.map((value) {
                                              return DropdownMenuItem(
                                                child: Text(value),
                                                value: value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              print(value);
                                              setState(() {
                                                kategoriVal = value.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Gambar usaha :",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                          controller: gambarController,
                                          decoration: InputDecoration(
                                              suffixIcon: GestureDetector(
                                                  onTap: () {},
                                                  child: const Icon(
                                                      Icons.upload_file)),
                                              hintText:
                                                  "Masukkan gambar usaha ...",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffDAD9D9)),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF6F6F6),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xffF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff98d3e6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12, bottom: 4),
                                          child: Text("Maps:",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16)),
                                        ),
                                        TextFormField(
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16),
                                          controller: mapsController,
                                          decoration: InputDecoration(
                                              hintText: "Masukkan maps ...",
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffDAD9D9)),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xffF6F6F6),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: const Color(
                                                        0xffF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff98d3e6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 300,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            if (namaController.text == "" ||
                                deskripsiController.text == "" ||
                                alamatController.text == "" ||
                                gambarController.text == "" ||
                                mapsController.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Masih ada yang belum diisi"),
                                  duration: const Duration(milliseconds: 1000),
                                ),
                              );
                            } else {
                              insert();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Data UMKM berhasil ditambahkan"),
                                  duration: const Duration(milliseconds: 1000),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      title: const Text("Pendaftaran UMKM"),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ));
}
