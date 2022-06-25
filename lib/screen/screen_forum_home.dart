import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_proting_kelompok4/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen_forum_detail.dart';
import 'package:http/http.dart' as http;

class ForumHome extends StatefulWidget {
  @override
  _ForumHomeState createState() => _ForumHomeState();
}

TextEditingController forumController = TextEditingController();

class _ForumHomeState extends State<ForumHome> {
  Future<List<dynamic>> fecthData() async {
    String apiUrl = MyUrl().getUrl() + "/api/forum";
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }

  Future insert() async {
    await http.post(
      Uri.parse(MyUrl().getUrl() + "/api/forum"),
      body: {
        "title": forumController.text,
      },
    );
  }

  void showForm(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Forum Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Nama Forum'),
              controller: forumController,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (forumController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Nama forum masih kosong"),
                          duration: const Duration(milliseconds: 1000),
                        ),
                      );
                    } else {
                      setState(() {
                        insert();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Forum berhasil dibuat"),
                            duration: const Duration(milliseconds: 1000),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        child: ListView(
          children: [
            Text(
              "Forum Diskusi",
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showForm(context);
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 213, 213, 213),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  children: [
                    Image.asset("image/tambah.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Tambah Topik Diskusi",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 450,
              child: FutureBuilder<List<dynamic>>(
                future: fecthData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: Text(
                                  snapshot.data![index]['title'],
                                  style: GoogleFonts.montserrat(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                padding: EdgeInsets.all(35),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 217, 232, 255),
                                  border: Border.all(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForumDetail(
                                    id: snapshot.data![index]['id_forum']
                                        .toString(),
                                    title: snapshot.data![index]['title'],
                                  );
                                },
                              ),
                            );
                          },
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
      ),
    );
  }
}
