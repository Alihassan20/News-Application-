
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/list_of_artical.dart';
import 'package:news_app/server/news_api.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../details_screen.dart';

class Artist extends StatefulWidget {
  const Artist({Key? key}) : super(key: key);

  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {

  @override
  Widget build(BuildContext context) {
    var future = NewsApi().fetchArticalByCategory('entertainment');
    Future<void> now()async {
      return NewsApi().fetchArticalByCategory('entertainment').then((user){
        setState(() {
          future=user;
        });
      });

    }
    final device = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
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
        ),
         FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot)  {
            ListArticle? data = snapshot.data;
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: now ,
                child:  ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: data!.articals!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Card(
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.white38,

                          child: Column(
                            children: [
                              data.articals![index].urlImage!=null ?
                              GestureDetector(
                                onTap:() async{
                                  await Future.delayed(const Duration(microseconds: 500), (){
                                    Navigator.pushNamed(context, DetailsScreen.routName,arguments: data.articals![index]);
                                  });
                                } ,
                                child: Hero(
                                  tag:data.articals![index].title.toString(),
                                  child: ClipRRect(
                                    child: Image.network(data.articals![index].urlImage.toString()),
                                    borderRadius:BorderRadius.circular(20),

                                  ),
                                ),
                              ):Hero(
                                tag:data.articals![index].title.toString(),
                                child: Container(
                                  width: device.width,
                                  height: device.height*0.3

                                  ,child: ClipRRect(
                                  child: Image.asset('image/nf.png'),
                                  borderRadius:BorderRadius.circular(20),
                                ),
                                ),
                              ),

                              GestureDetector(
                                onTap:() async{
                                  await Future.delayed(const Duration(microseconds: 500), (){
                                    Navigator.pushNamed(context, DetailsScreen.routName,arguments: data.articals![index]);
                                  });
                                } ,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(data.articals![index].title.toString(),style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                    textAlign: TextAlign.center,),
                                ),
                              )
                            ],

                          ),
                        ),
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());

            }
          },
        ),
      ],

    );
  }
}
