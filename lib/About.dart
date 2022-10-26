

import 'package:flutter/material.dart';
import 'package:codex/Home.dart';
import 'package:codex/NavBar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        //Desktop view
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [Nav(),AboutContent(),Footer()],))
        );
      }else{ // Mobile View
        return Scaffold(
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 50,width: 80,), 
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [Nav(),AboutContent(),Footer()],))
        );
      }
    });
  }
}
// Navigation bar of About,TechTalk,Events,Contact,News,NewDetail
class Nav extends StatelessWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff1B2B28),
      child: const Navbar(),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({Key? key}) : super(key: key);

  // Contents of about page
  content()
  {
    String detail = "Exploring Africa for deep technology start-ups and showcase them to the investors and world. We host sessions with start-ups by talking to their CEOs and also with experienced African developers, engineers who are making big impacts in technology around the world.\nOrganize yearly conference for African developers called Black Developers Conference, deep tech startups challenge called CODEX EVOLUTION for early stage deep tech start-ups and CODEX HACKATHON for new deep tech ideas to be developed and CODEX EXTREME for African developers to solve complex software problems in Africa.";
    return Column(
      children: [const Text('MISSION',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        Text(detail,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        const Text('VISSION',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        const Text('Building and supporting deep technology startups ecosystem in Africa to compete with Europe and United States.',
          style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/about_background.png'),
          fit: BoxFit.fill
        )
      ),
      child: content(),
    );
  }
}