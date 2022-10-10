

import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nextcode/NavBar.dart';

import 'About.dart';
import 'Home.dart';

class NewsDetailPage extends StatelessWidget {
  
  var title,imageId,detail;
  Storage storage;

  NewsDetailPage(this.title,this.imageId,this.detail,this.storage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        //Desktop view
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: [const Nav(),NewsDetail(title,imageId,detail,storage),const Footer()],))
        );
      }else{ // Mobile View
        return Scaffold(
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 80,width: 80,),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: [const Nav(),NewsDetail(title,imageId,detail,storage),const Footer()],))
        );
      }
    });
  }
}

class NewsDetail extends StatelessWidget {

  var title,imageId,detail;

  Storage storage;

  NewsDetail(this.title,this.imageId,this.detail,this.storage);

  newsDetail()
  {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Column(
        children: [
          FutureBuilder(future: storage.getFilePreview(bucketId: "63415094ef991df505b4",fileId: imageId,
          ), builder: (context,snapshot){
            return snapshot.hasData && snapshot.data != null
            ? Container(
              height: 200, 
              width: 300, 
              decoration: BoxDecoration(
                image: DecorationImage(image: MemoryImage(snapshot.data as Uint8List),fit: BoxFit.fill)
              )) : const CircularProgressIndicator();
          }),
          Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
          Text("""dsjfj dd sljfkjsdkljflkjsdlkfjkljjksldkjfk lsjfljkjuiukjalsdjklfjdskljfdskfjlkjdsklfjlkdsjfkjljsdjflksdjlfkjksdjlfjds
          klsjdkfjdsk flkjsdlkjflkjsdkjflj lksjdfkjiowefksd lkjsdkjfsd lksjdklfjsd klsdjlkfjskldfjsdlkjflks lksjdlkjfskdjfksdjf lksdjfsdfj
          klsdjfkj lkjsdklfjioeurnsdafiuoiwe sdfoiewquruyrhtf asdfadsjfhewi jasdfhjhsadf kjsalkdjfksd flkjsdf lkjklfjasdlk;jfkljl ljlksdjfks""")
        ],)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return newsDetail();
  }
}