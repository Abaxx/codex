import 'dart:convert';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:codex/Home.dart';
//import 'package:nextcode/NewsDetail.dart';

import 'About.dart';
import 'NavBar.dart';
import 'NewsDetail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  // Appwrite database access
  late Client client;
  late Databases databases;
  late Storage storage;

  @override
  initState(){
    super.initState();

    client = Client().setEndpoint("https://localhost/v1").setProject("34d22bfbab52658bf76");
    databases = Databases(client);
    storage = Storage(client);
    
    loadData();
  }

// Extract datas from appwrite database
  void loadData() async {
    try {
      final res = await databases.listDocuments(databaseId: "634d234d8d4a80a2691f", collectionId: "634d2359e93f7024db25");
      setState(() {
        newslist = res.documents;
        length = newslist.length;
        });
    } on AppwriteException catch(e) {
      print(e.message);
    }

  }
  // Contain list of news.
  List newslist = [];
  late int length;

  // News on desktop 
  deskTopNews(BuildContext context,int index) {

    double wdth = 0.2 * MediaQuery.of(context).size.width;
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> NewsDetailPage(
          newslist[index].data['title'],newslist[index].data["imageId"],newslist[index].data["detail"],storage)),);
    },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(children: [
          FutureBuilder(future: storage.getFilePreview(bucketId: "634d2562b19971ade545",fileId: newslist[index].data["imageId"],
          ), builder: (context,snapshot){
            return snapshot.hasData && snapshot.data != null
            ? Container(
              height: 200, 
              width: wdth, 
              decoration: BoxDecoration(
                image: DecorationImage(image: MemoryImage(snapshot.data as Uint8List),fit: BoxFit.fill)
              )) : const CircularProgressIndicator();
          }),
          const SizedBox(width: 5,),
          Container(
            alignment: Alignment.center,
            width: 0.2 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newslist[index].data["title"],style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                Text(newslist[index].data["date"],style: TextStyle(fontSize: 10),),
              ],
            ),),
        ],),
      ),
    );
  }

  // News on mobile phone
  mobileNews(BuildContext context,int index) {

    double wdth = 0.2 * MediaQuery.of(context).size.width;

    return GestureDetector(onTap: (){
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context)=> NewsDetailPage(
            newslist[index].data["title"],newslist[index].data["imageId"],newslist[index].data["detail"],storage)),);
    },
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(children: [
          FutureBuilder(future: storage.getFilePreview(bucketId: "63468fe74658c4b59a87",fileId: newslist[index].data["imageId"],
         ), builder: (context,snapshot){
            return snapshot.hasData && snapshot.data != null
            ? Container(
              height: 100, 
              width: wdth, 
              decoration: BoxDecoration(
                image: DecorationImage(image: MemoryImage(snapshot.data as Uint8List),fit: BoxFit.fill)))
                 : const CircularProgressIndicator();
          }),
          const SizedBox(width: 5,),
          Container(
            alignment: Alignment.center,
            width: 0.3 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newslist[index].data['title'], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17,),),
                Text(newslist[index].data['date'],style: TextStyle(fontSize: 10),),
              ],
            ),)
        ],),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
    // Desktop view
      if(constraints.biggest.width > 800){
        return Scaffold(
          backgroundColor: const Color(0xffEFEFEF),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: const [Nav(),Header()],),),
                    /*const SliverPadding(
                      padding: EdgeInsets.only(top: 20)),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                //algorithm for arrange custom view children in order
                int a = 2 * index;
                int b = 2 * index + 1;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    deskTopNews(context,a),deskTopNews(context, b)],);
              },childCount: length-2),),
              const SliverToBoxAdapter(child: FooterPage(),)*/],
          ),
        );
      }else{
        // Mobile view
        return Scaffold(
          backgroundColor: Color(0xffEFEFEF),
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 80,width: 80,),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(children: const [Nav(),Header()],),),
                  /*const SliverPadding(padding: EdgeInsets.only(top: 20)),
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mobileNews(context,index)
                    ],
                  );
                },childCount: length),),
                const SliverToBoxAdapter(child: FooterPage(),)*/],
            ),
        );
      }
    });
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: LayoutBuilder(builder: (context,constraints){
        if(constraints.biggest.width > 800){
          return const Center( child: Text('Deep Technology News for Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),);
        }else { return const Center(child: Text('Deep Technology News for Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),);}
      }),
    );
  }
}
