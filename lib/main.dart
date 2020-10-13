import 'package:flutter/material.dart';
import 'package:snip/Pages/menu.dart';
import 'package:snip/Pages/ubahpassword.dart';
import 'package:snip/pages/Profil.dart';
import 'package:snip/Pages/Login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snip/Pages/SplashSreen.dart';
import 'package:snip/Pages/news.dart';


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
                "Gusti Fajar",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: Text("Thefajaris0853@gmail.com"),
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
                    child: ListView(
                      controller: PageController(
                        viewportFraction: 0.8,
                        initialPage: 0,
                      ),
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        WhatsTrending(
                          menu: "Achievements",
                          gambar:
                              "https://snip-id.com/laravel/storage/app/public/image/non-banner/IMG-20200827-WA0024.jpg",
                          title:
                              "GEMILANG! LULUSAN SMKN 1 BALIKPAPAN BERHASIL MENJADI KETUA GREEN GENERATION INDONESIA 2020",
                          date: "Published 30, Aug 2020",
                          detailtext:
                              "Halo SNIPersss!. Ada kabar bagus nih dari kakak alumni SMKN 1 Balikpapan, ya kak Zidane yang merupakan Alumni SMKN 1 Balikpapan tahun 2020 menjadi Ketua Green Generation Indonesia looo, tapi pertama kita simak dulu Green Generation itu apa sih.Green Generation merupakan organisasi NGO yang bertujuan untuk mewujudkan generasi yang peduli dan berbudaya lingkungan, generasi yang dituju di organisasi ini adalah para pelajar SD sampai SMA/Sederajat.",
                        ),
                        WhatsTrending(
                          menu: "Achievements",
                          gambar:
                              "https://snip-id.com/laravel/storage/app/public/image/non-banner/IMG-20200827-WA0024.jpg",
                          title:
                              "GEMILANG! LULUSAN SMKN 1 BALIKPAPAN BERHASIL MENJADI KETUA GREEN GENERATION INDONESIA 2020",
                          date: "Published 30, Aug 2020",
                          detailtext:
                              "Halo SNIPersss!. Ada kabar bagus nih dari kakak alumni SMKN 1 Balikpapan, ya kak Zidane yang merupakan Alumni SMKN 1 Balikpapan tahun 2020 menjadi Ketua Green Generation Indonesia looo, tapi pertama kita simak dulu Green Generation itu apa sih.Green Generation merupakan organisasi NGO yang bertujuan untuk mewujudkan generasi yang peduli dan berbudaya lingkungan, generasi yang dituju di organisasi ini adalah para pelajar SD sampai SMA/Sederajat.",
                        ),
                        WhatsTrending(
                          menu: "Achievements",
                          gambar:
                              "https://snip-id.com/laravel/storage/app/public/image/non-banner/IMG-20200827-WA0024.jpg",
                          title:
                              "GEMILANG! LULUSAN SMKN 1 BALIKPAPAN BERHASIL MENJADI KETUA GREEN GENERATION INDONESIA 2020",
                          date: "Published 30, Aug 2020",
                          detailtext:
                              "Halo SNIPersss!. Ada kabar bagus nih dari kakak alumni SMKN 1 Balikpapan, ya kak Zidane yang merupakan Alumni SMKN 1 Balikpapan tahun 2020 menjadi Ketua Green Generation Indonesia looo, tapi pertama kita simak dulu Green Generation itu apa sih.Green Generation merupakan organisasi NGO yang bertujuan untuk mewujudkan generasi yang peduli dan berbudaya lingkungan, generasi yang dituju di organisasi ini adalah para pelajar SD sampai SMA/Sederajat.",
                        ),
                        WhatsTrending(
                          menu: "Achievements",
                          gambar:
                              "https://snip-id.com/laravel/storage/app/public/image/non-banner/IMG-20200827-WA0024.jpg",
                          title:
                              "GEMILANG! LULUSAN SMKN 1 BALIKPAPAN BERHASIL MENJADI KETUA GREEN GENERATION INDONESIA 2020",
                          date: "Published 30, Aug 2020",
                          detailtext:
                              "Halo SNIPersss!. Ada kabar bagus nih dari kakak alumni SMKN 1 Balikpapan, ya kak Zidane yang merupakan Alumni SMKN 1 Balikpapan tahun 2020 menjadi Ketua Green Generation Indonesia looo, tapi pertama kita simak dulu Green Generation itu apa sih.Green Generation merupakan organisasi NGO yang bertujuan untuk mewujudkan generasi yang peduli dan berbudaya lingkungan, generasi yang dituju di organisasi ini adalah para pelajar SD sampai SMA/Sederajat.",
                        ),
                        WhatsTrending(
                          menu: "Achievements",
                          gambar:
                              "https://snip-id.com/laravel/storage/app/public/image/non-banner/IMG-20200827-WA0024.jpg",
                          title:
                              "GEMILANG! LULUSAN SMKN 1 BALIKPAPAN BERHASIL MENJADI KETUA GREEN GENERATION INDONESIA 2020",
                          date: "Published 30, Aug 2020",
                          detailtext:
                              "Halo SNIPersss!. Ada kabar bagus nih dari kakak alumni SMKN 1 Balikpapan, ya kak Zidane yang merupakan Alumni SMKN 1 Balikpapan tahun 2020 menjadi Ketua Green Generation Indonesia looo, tapi pertama kita simak dulu Green Generation itu apa sih.Green Generation merupakan organisasi NGO yang bertujuan untuk mewujudkan generasi yang peduli dan berbudaya lingkungan, generasi yang dituju di organisasi ini adalah para pelajar SD sampai SMA/Sederajat.",
                        ),
                      ],
                    )),
                Container(
                  height: 20.0,
                ),
                Container(
                  height: 115.0,
                  child: ListView(
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
                News(
                  judul:
                      "TETAP SEHAT SELAMA DIRUMAH AJA DENGAN MENERAPKAN 5 TIPS BERIKUT",
                  gambar:
                      "https://snip-id.com/laravel/storage/app/public/image/non-banner/images (5).jpeg",
                  menu: "Others",
                  date: "Published 18, Aug 2020",
                ),
                News(
                  judul: "UPACARA MEMPERINGATI HUT RI KE-75",
                  gambar:
                      "https://snip-id.com/laravel/storage/app/public/image/non-banner/line_229105690399309.jpg",
                  menu: "Events",
                  date: "Published 17, Aug 2020",
                ),
                News(
                  judul: "PEMOTONGAN HEWAN QURBAN",
                  gambar:
                      "https://snip-id.com/laravel/storage/app/public/image/non-banner/SAVE_20200801_215108.jpg",
                  menu: "Events",
                  date: "Published 01, Aug 2020",
                ),
                News(
                  judul: "Silahturahmi Pelepasan Purna Tugas",
                  gambar:
                      "https://snip-id.com/laravel/storage/app/public/image/non-banner/WhatsApp Image 2020-08-04 at 07.10.14 (2).jpeg",
                  menu: "Events",
                  date: "Published 05, Aug 2020",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
