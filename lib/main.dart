import 'package:flutter/material.dart';
import 'package:snip/Pages/menu.dart';
import 'package:snip/Pages/ubahpassword.dart';
import 'package:snip/pages/Profil.dart';
import 'package:snip/Pages/Login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snip/Pages/SplashSreen.dart';
import 'package:snip/Pages/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashSreen(),
    );
  }
}

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List newsdata = [];
  Future<List> datanews() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get('https://snip-id.com/api/index', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + sharedPreferences.getString('token')
    });
    Map<String, dynamic> _newsdata;
    _newsdata = json.decode(response.body);
    setState(() {
      newsdata = _newsdata['data'];
    });
  }

  var name;
  var email;
  var menu;
  getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    name = sharedPreferences.getString("name");
    email = sharedPreferences.getString("email");
  }

  @override
  void initState() {
    super.initState();
    datanews();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "SNIPBISA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.black,
              accountName: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: Text(email),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_image_2.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profilpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Ubah Password"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UbahPassword()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString('token', '');
                sharedPreferences.setString('email', '');
                sharedPreferences.setString('name', '');
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => Loginpage()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_image_2.jpg'),
              fit: BoxFit.fill),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 40.0,
                  child: Text("Whats trending",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
                Container(
                    height: 424,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: newsdata.toString() == '[]' ? 0 : 5,
                      itemBuilder: (context, index) {
                      String menu;
                      if (newsdata[index]['category'] == 1) {
                        menu = "MySchool";
                      } else if (newsdata[index]['category'] == 2) {
                        menu = "Events";
                      } else if (newsdata[index]['category'] == 3) {
                        menu = "Acievements";
                      } else if (newsdata[index]['category'] == 4) {
                        menu = "E-Commerce";
                      } else if (newsdata[index]['category'] == 6) {
                        menu = "Jobs&Campus";
                      } else if (newsdata[index]['category'] == 5) {
                        menu = "Others";
                      }
                        return WhatsTrending(
                        title: newsdata[index]['title'],
                        gambar:
                            'https://snip-id.com/laravel/storage/app/public/image/non-banner/' +
                                newsdata[index]['nonbanner'],
                        menu: menu,
                        detailtext: "oh nooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo i dont know what must i put in here",
                        date: "Published " + newsdata[index]['created_at'],
                        );
                      },
                    )),
                Container(
                  height: 20.0,
                ),
                Container(
                  height: 115.0,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Menu(
                        title: "MySchool",
                        warna: Colors.red,
                        menu: MySchoolMenu(),
                      ),
                      Menu(
                        title: "Events",
                        warna: Colors.orange,
                        menu: EventMenu(),
                      ),
                      Menu(
                        title: "Acievements",
                        warna: Colors.pink,
                        menu: AcievementsMenu(),
                      ),
                      Menu(
                        title: "E-Commerce",
                        warna: Colors.grey,
                        menu: ECommerceMenu(),
                      ),
                      Menu(
                        title: "Jobs&Campus",
                        warna: Colors.purple,
                        menu: JobsCampusMenu(),
                      ),
                      Menu(
                        title: "Others",
                        warna: Colors.blue,
                        menu: OthersMenu(),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsdata.toString() == '[]' ? 0 : 20,
                    itemBuilder: (context, index) {
                      String menu;
                      if (newsdata[index]['category'] == 1) {
                        menu = "MySchool";
                      } else if (newsdata[index]['category'] == 2) {
                        menu = "Events";
                      } else if (newsdata[index]['category'] == 3) {
                        menu = "Acievements";
                      } else if (newsdata[index]['category'] == 4) {
                        menu = "E-Commerce";
                      } else if (newsdata[index]['category'] == 6) {
                        menu = "Jobs&Campus";
                      } else if (newsdata[index]['category'] == 5) {
                        menu = "Others";
                      }
                      return News(
                        judul: newsdata[index]['title'],
                        gambar:
                            'https://snip-id.com/laravel/storage/app/public/image/non-banner/' +
                                newsdata[index]['nonbanner'],
                        menu: menu,
                        detailtext: newsdata[index]['description'],
                        date: "Published " + newsdata[index]['created_at'],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
