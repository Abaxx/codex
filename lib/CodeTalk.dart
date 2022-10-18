
import 'package:flutter/material.dart';
import 'package:codex/Home.dart';

import 'NavBar.dart';

class CodeTalkPage extends StatelessWidget {
  const CodeTalkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        // Desktop view of Techtalk
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Header(),CodeTalkSection(),FooterPage()],))
        );
      }else{
        //Mobile View of Techtalk
        return Scaffold(
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 80,width: 80,),onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Header(),CodeTalkSection(),FooterPage()],))
        );
      }
    });
  }
}

class Nav extends StatelessWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff1B2B28),
      /*decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/navbar_background.png'),
          fit: BoxFit.fill
        )
      ),*/
      child: const Navbar(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/codetalk_header.png'),
          fit: BoxFit.fill
        )
      ),
      child: LayoutBuilder(builder: (context,constraints){
        if(constraints.biggest.width > 800){
          return const Center(
            child: Text('Deep talk about Technology in Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),);
        }else { 
          return const Center(
            child: Text('Deep talk about Technology in Africa.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),);}
      }),
    );
  }
}

class CodeTalkSection extends StatelessWidget {
  const CodeTalkSection({Key? key}) : super(key: key);

  desktopView(BuildContext context)
  {
    return Container(
      //height: 700,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/techtalk_background.png'),
              fit: BoxFit.fill
          )
      ),
      padding: const EdgeInsets.symmetric(vertical: 150,horizontal: 150),
      child: Column(
        children: [Image.asset('assets/images/codetalk.png',),
          const SizedBox(height: 150),
          Image.asset('assets/images/techtalk2.png',)],),
    );
  }

  mobileView(BuildContext context)
  {
    return Container(
      //height: 700,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/techtalk_background.png'),
              fit: BoxFit.fill
          )
      ),
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
      child: Column(
        children: [Image.asset('assets/images/codetalk.png',),
          const SizedBox(height: 50),
          Image.asset('assets/images/techtalk2.png',)],),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return desktopView(context);
      }else { return mobileView(context); }
    });
  }
}