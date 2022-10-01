

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nextcode/NavBar.dart';

import 'About.dart';
import 'Home.dart';

class NewsDetailPage extends StatelessWidget {
  var title,img,detail;

  NewsDetailPage(this.title,this.img,this.detail);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        //Desktop view
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: [const Nav(),NewsDetail(title,img,detail),const Footer()],))
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
            body:  SingleChildScrollView(child: Column(children: [const Nav(),NewsDetail(title,img,detail),const Footer()],))
        );
      }
    });
  }
}

class NewsDetail extends StatelessWidget {
  var title,img,detail;

  NewsDetail(this.title,this.img,this.detail);

  newsDetail()
  {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Column(
        children: [
          Image.asset(img,height: 200,width: 300,fit: BoxFit.fill,),
          Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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