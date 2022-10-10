import 'dart:convert';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:nextcode/Home.dart';
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
  RealtimeSubscription? subscription;

  @override
  initState(){
    super.initState();

    client = Client().setEndpoint('https://localhost/v1').setProject('6334a5877e854269a6f0');
    databases = Databases(client);
    storage = Storage(client);
    
    loadData();
  }

// Extract datas from appwrite database
  void loadData() async {
    try {
      final res = await databases.listDocuments(databaseId: '6334a8a3177a28634964', collectionId: '6334a9270023cdbf9e16');
      setState(() {
        newslist = res.documents;
        });
    } on AppwriteException catch(e) {
      print(e.message);
    }

  }
  // Contain list of news.
  List newslist = [];

  // News on desktop 
  deskTopNews(BuildContext context,int index) {

    double wdth = 0.2 * MediaQuery.of(context).size.width;
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailPage(newslist[index].data['Title'],newslist[index].data["imageId"],"kdfj",storage)),);
    },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(children: [
          FutureBuilder(future: storage.getFilePreview(bucketId: "63415094ef991df505b4",fileId: newslist[index].data["imageId"],
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
                Text(newslist[index].data['Title'],style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                const Text('20/08/2022',style: TextStyle(fontSize: 10),),
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailPage(newslist[index].data['Title'],newslist[index].data["imageId"],"kdfj",storage)),);
    },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(children: [
          FutureBuilder(future: storage.getFilePreview(bucketId: "63415094ef991df505b4",fileId: newslist[index].data["imageId"],
         ), builder: (context,snapshot){
            return snapshot.hasData && snapshot.data != null
            ? Container(
              height: 100, 
              width: wdth, 
              decoration: BoxDecoration(
                image: DecorationImage(image: MemoryImage(snapshot.data as Uint8List),fit: BoxFit.fill))) : const CircularProgressIndicator();
          }),
          const SizedBox(width: 5,),
          Container(
            alignment: Alignment.center,
            width: 0.3 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newslist[index].data['Title'], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17,),),
                const Text('20/08/2022',style: TextStyle(fontSize: 10),),
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
          body: CustomScrollView(
            slivers: [SliverToBoxAdapter(child: Column(children: const [Nav(),Header()],),),const SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    deskTopNews(context,index),deskTopNews(context, index)],);
              },childCount: 2,),),const SliverToBoxAdapter(child: Footer(),)],
          ),
        );
      }else{// Mobile view
        return Scaffold(
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 80,width: 80,),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body: CustomScrollView(
              slivers: [SliverToBoxAdapter(child: Column(children: const [Nav(),Header()],),),const SliverPadding(padding: EdgeInsets.only(top: 20)),
                SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mobileNews(context,index)
                    ],
                  );
                },childCount: 2,),),const SliverToBoxAdapter(child: Footer(),)],
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
      color: Colors.black87,
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: LayoutBuilder(builder: (context,constraints){
        if(constraints.biggest.width > 800){
          return const Center( child: Text('Deep Technology News for Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),);
        }else { return const Center(child: Text('Deep Technology News for Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),);}
      }),
    );
  }
}
