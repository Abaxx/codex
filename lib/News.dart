

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextcode/Home.dart';
import 'package:nextcode/NewsDetail.dart';

import 'About.dart';
import 'NavBar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {

  @override
  initState(){
    super.initState();
    _initData();
  }

  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
      info = json.decode(value);
    });
  }

  List info = [];
  deskTopNews(BuildContext context,int index) {
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewsDetail()),);
    },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(children: [
          Image.asset(info[index]['img'], height: 200, width: 0.2 * MediaQuery.of(context).size.width,fit: BoxFit.fill,),
          const SizedBox(width: 5,),
          Container(
            alignment: Alignment.center,
            width: 0.2 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(info[index]['title'].toUpperCase(),style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                const Text('20/08/2022',style: TextStyle(fontSize: 10),),
              ],
            ),),
        ],),
      ),
    );
  }

  mobileNews(BuildContext context,int index) {
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewsDetail()),);
    },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(children: [
          Image.asset(info[index]['img'], height: 100, width: 0.3 * MediaQuery.of(context).size.width,fit: BoxFit.fill,),
          const SizedBox(width: 5,),
          Container(
            alignment: Alignment.center,
            width: 0.3 * MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(info[index]['title'].toUpperCase(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17,),),
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
      if(constraints.biggest.width > 800){
        return Scaffold(
          body: CustomScrollView(
            slivers: [SliverToBoxAdapter(child: Column(children: const [Nav(),Header()],),),const SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    deskTopNews(context,index),deskTopNews(context, index)],);
              },childCount: info.length,),),const SliverToBoxAdapter(child: Footer(),)],
          ),
        );
      }else{
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
                },childCount: info.length,),),const SliverToBoxAdapter(child: Footer(),)],
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
