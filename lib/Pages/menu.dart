import 'package:flutter/material.dart';
import 'package:snip/main.dart';
import 'package:snip/Pages/Login_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatelessWidget {
  Menu({this.title, this.icon, this.warna, this.menu});
  final String title;
  final String icon;
  final MaterialColor warna;
  final menu;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => menu));
            },
            child: Container(
              height: 110.0,
              width: 152.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: warna,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Container(height: 30),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySchoolMenu extends StatefulWidget {
  @override
  _MySchoolMenuState createState() => _MySchoolMenuState();
}

class _MySchoolMenuState extends State<MySchoolMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SNIPBISA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
          ),
        ),
        endDrawer: new Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    "MySchool",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MySchoolMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Acievements",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcievementsMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ECommerceMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Jobs&Campus",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsCampusMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OthersMenu()));
                  },
                ),
              ],
            ),
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
                height: 250,
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "MySchool",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsdata.toString() == '[]' ? 0 : newsdata.length,
                  itemBuilder: (context, index) {
                    String menu;
                    if (newsdata[index]['category'] == 1) {
                      menu = "MySchool";
                      return CardNews(
                        judul: newsdata[index]['title'],
                        gambar:
                            'https://snip-id.com/laravel/storage/app/public/image/non-banner/' +
                                newsdata[index]['nonbanner'],
                        menu: menu,
                        detailtext: newsdata[index]['description'],
                        date: "Published " + newsdata[index]['created_at'],
                      );
                    } else if (newsdata[index]['category'] != 1) {
                      Container();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class EventMenu extends StatefulWidget {
  @override
  _EventMenuState createState() => _EventMenuState();
}

class _EventMenuState extends State<EventMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SNIPBISA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mainpage()),
            );
          },
        ),
      ),
      endDrawer: new Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                },
              ),
              ListTile(
                title: Text(
                  "MySchool",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MySchoolMenu()));
                },
              ),
              ListTile(
                title: Text(
                  "Event",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EventMenu()));
                },
              ),
              ListTile(
                title: Text(
                  "Acievements",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AcievementsMenu()));
                },
              ),
              ListTile(
                title: Text(
                  "E-Commerce",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ECommerceMenu()));
                },
              ),
              ListTile(
                title: Text(
                  "Jobs&Campus",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobsCampusMenu()));
                },
              ),
              ListTile(
                title: Text(
                  "Others",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OthersMenu()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_image_2.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              color: Colors.grey,
              child: Center(
                child: Text(
                  "Event",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AcievementsMenu extends StatefulWidget {
  @override
  _AcievementsMenuState createState() => _AcievementsMenuState();
}

class _AcievementsMenuState extends State<AcievementsMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SNIPBISA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
          ),
        ),
        endDrawer: new Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    "MySchool",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MySchoolMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Acievements",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcievementsMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ECommerceMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Jobs&Campus",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsCampusMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OthersMenu()));
                  },
                ),
              ],
            ),
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
                height: 250,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "Acievements",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsdata.toString() == '[]' ? 0 : newsdata.length,
                  itemBuilder: (context, index) {
                    String menu;
                    var i = 0;
                    if (newsdata[index]['category'] == 3) {
                      menu = "Acievements";
                      return CardNews(
                        judul: newsdata[index]['title'],
                        gambar:
                            'https://snip-id.com/laravel/storage/app/public/image/non-banner/' +
                                newsdata[index]['nonbanner'],
                        menu: menu,
                        detailtext: newsdata[index]['description'],
                        date: "Published " + newsdata[index]['created_at'],
                      );
                    } else if (newsdata[index]['category'] != 3) {
                      newsdata.skip(i++);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ECommerceMenu extends StatefulWidget {
  @override
  _ECommerceMenuState createState() => _ECommerceMenuState();
}

class _ECommerceMenuState extends State<ECommerceMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SNIPBISA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
          ),
        ),
        endDrawer: new Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    "MySchool",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MySchoolMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Acievements",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcievementsMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ECommerceMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Jobs&Campus",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsCampusMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OthersMenu()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_image_2.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "E-Commerce",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobsCampusMenu extends StatefulWidget {
  @override
  _JobsCampusMenuState createState() => _JobsCampusMenuState();
}

class _JobsCampusMenuState extends State<JobsCampusMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SNIPBISA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
          ),
        ),
        endDrawer: new Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    "MySchool",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MySchoolMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Acievements",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcievementsMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ECommerceMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Jobs&Campus",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsCampusMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OthersMenu()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_image_2.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "Jobs&Campus",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OthersMenu extends StatefulWidget {
  @override
  _OthersMenuState createState() => _OthersMenuState();
}

class _OthersMenuState extends State<OthersMenu> {
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

  @override
  void initState() {
    super.initState();
    datanews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "SNIPBISA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
          ),
        ),
        endDrawer: new Drawer(
          child: Container(
            color: Colors.black,
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                ),
                ListTile(
                  title: Text(
                    "MySchool",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MySchoolMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Event",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Acievements",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AcievementsMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ECommerceMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Jobs&Campus",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobsCampusMenu()));
                  },
                ),
                ListTile(
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OthersMenu()));
                  },
                ),
              ],
            ),
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
                height: 250,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "Others",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsdata.toString() == '[]' ? 0 : newsdata.length,
                  itemBuilder: (context, index) {
                    String menu;
                    if (newsdata[index]['category'] == 5) {
                      menu = "Others";
                      return CardNews(
                        judul: newsdata[index]['title'],
                        gambar:
                            'https://snip-id.com/laravel/storage/app/public/image/non-banner/' +
                                newsdata[index]['nonbanner'],
                        menu: menu,
                        detailtext: newsdata[index]['description'],
                        date: "Published " + newsdata[index]['created_at'],
                      );
                    } else {
                      print("Do nothing");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNews extends StatelessWidget {
  CardNews({this.gambar, this.judul, this.menu, this.detailtext, this.date});
  final String judul;
  final String gambar;
  final String menu;
  final String detailtext;
  final String date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailBerita(
                    detailtext: detailtext,
                    title: judul,
                    image: gambar,
                    date: date,
                    menu: menu,
                  )),
        );
      },
      child: Container(
        width: 340.0,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
              image: NetworkImage(gambar),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.grey.withOpacity(0.5), BlendMode.dstATop)),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        height: 160,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        date,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[100]),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 15.0,
                    ),
                    Container(
                      width: 315.0,
                      child: Text(
                        judul,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      width: 15.0,
                    ),
                    Container(
                      child: Text(
                        menu,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[100]),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DetailBerita extends StatelessWidget {
  DetailBerita({
    this.title,
    this.image,
    this.detailtext,
    this.menu,
    this.date,
  });
  final String title;
  final String image;
  final String detailtext;
  final String menu;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SNIPBISA",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                new Container(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 15)),
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            children: [
                              Text(
                                menu,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  constraints: BoxConstraints(maxWidth: 340),
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.0,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RichText(
                      text: TextSpan(
                          text: detailtext,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.5,
                          )),
                      textAlign: TextAlign.justify,
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    children: [
                      new Flexible(
                        child: Theme(
                          data: new ThemeData(
                            primaryColor: Colors.black,
                            primaryColorDark: Colors.red,
                          ),
                          child: new TextField(
                            decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(25.0),
                                ),
                              ),
                              hintText: 'Comment',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Ink(
                        decoration: ShapeDecoration(
                          color: Colors.lightBlue,
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 2.5, top: 2.5),
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Admin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 126,
                                    ),
                                    Text(
                                      "17 November 2020",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          "Keren sekali",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 2.5, top: 2.5),
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(30),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Admin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      width: 126,
                                    ),
                                    Text(
                                      "17 November 2020",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          "Keren sekali",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
