import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'botom_navigation_bar/artist.dart';
import 'botom_navigation_bar/health.dart';
import 'botom_navigation_bar/politics.dart';
import 'botom_navigation_bar/sports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: const MENU_SCREEN(),
      mainScreen: const MAIN_SCREEN(),
      borderRadius: 40.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.white70,
      slideWidth: MediaQuery.of(context).size.width * .50,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
        isRtl:true,
    );
  }
}

class MENU_SCREEN extends StatefulWidget {
  const MENU_SCREEN({Key? key}) : super(key: key);

  @override
  _MENU_SCREENState createState() => _MENU_SCREENState();
}

class _MENU_SCREENState extends State<MENU_SCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                    const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                    const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.5, 1])),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        padding:const  EdgeInsets.only(bottom: 10,right: 10),
                        child:const  DecoratedBox(
                          decoration: ShapeDecoration(
                              shape:  CircleBorder(),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image:  NetworkImage("https://images.unsplash.com/photo-1606561956792-cd1dc8b7f7dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1532&q=80"),
                              )),
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.only(right: 25),
                        child:  Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.only(right: 2,top: 5),
                        child:  Text(
                          "Your Name",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Edit profile");
                        },
                        child:const Padding(
                          padding:  EdgeInsets.only(top: 5,right: 9),
                          child:  Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlatButton(
                    child:const  Text("Home", style: TextStyle(color: Colors.black87,),),
                    onPressed: () {
                    },
                  ),
                  FlatButton(
                    child:const  Text("Home", style: TextStyle(color: Colors.black87,),),
                    onPressed: () {
                    },
                  ),
                  FlatButton(
                    child:const  Text("Home", style: TextStyle(color: Colors.black87,),),
                    onPressed: () {
                    },
                  ),
                  FlatButton(
                    child:const  Text("Home", style: TextStyle(color: Colors.black87,),),
                    onPressed: () {
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Colors.black87,
                thickness: 1
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlatButton(
                    child: const Text("Contact Us", style: TextStyle(color: Colors.black87,)),
                    onPressed: () {
                    },
                  ),
                  FlatButton(
                    child:const  Text("About Us", style: TextStyle(color: Colors.black87,)),
                    onPressed: () {
                    },
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(left: 200.0),
                child:const  ListTile(
                  tileColor: Colors.black87,
                  title: Text("Logout", style: TextStyle(color: Colors.black87,)),
                  // onTap: () => _handleLogout(context)

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MAIN_SCREEN extends StatefulWidget {
  const MAIN_SCREEN({Key? key}) : super(key: key);

  @override
  _MAIN_SCREENState createState() => _MAIN_SCREENState();
}
int _tabBarIndex = 0;
List<Widget> screens = [
  const Sports(),
  const Artist(),
  const Health(),
  const Science(),
];

class _MAIN_SCREENState extends State<MAIN_SCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        items: const [
          TabItem(title: "Sports", icon: Icon(Icons.sports_baseball)),
          TabItem(title: "art News", icon: Icon(Icons.movie)),
          TabItem(title: "Business", icon: Icon(Icons.business)),
          TabItem(title: "Science", icon: Icon(Icons.science)),
        ],
        elevation: 0,
        activeColor: Colors.black87,
        backgroundColor:
        const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.9),
        initialActiveIndex: _tabBarIndex,
        onTap: (value) {
          setState(() {
            _tabBarIndex = value;
          });
        },
      ),
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                      const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                      const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0, 0.5, 1])),
          ),
          title: const Text.rich(TextSpan(children: [
            TextSpan(
              text: "News",
              style: TextStyle(
                  color: Color.fromRGBO(46, 76, 109, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            TextSpan(
                text: " App",
                style: TextStyle(
                    color: Color.fromRGBO(218, 221, 252, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold))
          ])),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
                icon:const Icon(Icons.menu))
          ], ),
      body:  screens[_tabBarIndex],
    );
  }
}