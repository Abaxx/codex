
import 'package:flutter/material.dart';
import 'package:codex/Home.dart';

import 'About.dart';
import 'NavBar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        // Desktop View
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Events(),FooterPage()],))
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
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Events(),FooterPage()],))
        );
      }
    });
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  blackDeveloper()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Image.asset('assets/images/black_conf.png',height: 400,width: 400,),
        const Text(' BLACK DEVELOPERS CONFERENCE 2023',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],
    );
  }

  nextcodeEvolution()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Column(children: const [Text('CODEX EVOLUTION',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text('A challenge for early stage tech start-ups ',style: TextStyle(color: Colors.white),)]),
        Image.asset('assets/images/evolution.png',height: 400,width: 400,)],
    );
  }

  nextcodeExtreme()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Image.asset('assets/images/extreme.png',height: 400,width: 400,),Column(children: const [Text(' CODEX EXTREME',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text(' A challenge for African developers to solve complex software problems ',style: TextStyle(color: Colors.white),)]),],
    );
  }

  nextcodeHackathon()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Column(children: const [Text('CODEX HACKATHON',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text('A hackathon for new deep tech ideas to be developed ',style: TextStyle(color: Colors.white),)]),
        Image.asset('assets/images/hackathon.png',height: 400,width: 400,)],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/events_background.png'),
          fit: BoxFit.fill,
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 150),
      child: Column(children: [const Text('UPCOMING EVENTS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        const SizedBox(height: 80,),
        blackDeveloper(),nextcodeEvolution(),nextcodeExtreme(),nextcodeHackathon()],),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  blackDeveloper()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Image.asset('assets/images/black_conf.png',height: 200,width: 200,fit: BoxFit.fill,),
        const SizedBox(height: 5,),
        const Text('Be part of Black Developers Conference 2023',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)],
    );
  }

  nextcodeEvolution()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Image.asset('assets/images/evolution.png',height: 200,width: 200,fit: BoxFit.fill,),
        const SizedBox(height: 5,),
        Column(children: const [Text('CODEX EVOLUTION',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text('A challenge for early stage tech start-ups',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)]),],
    );
  }

  nextcodeExtreme()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Image.asset('assets/images/extreme.png',height: 200,width: 200,fit: BoxFit.fill,),
        const SizedBox(height: 5,),
        Column(children: const [Text(' CODEX EXTREME',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text('A challenge for African developers to solve complex software problems',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)]),],
    );
  }

  nextcodeHackathon()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Image.asset('assets/images/hackathon.png',height: 200,width: 200,fit: BoxFit.fill,),
        const SizedBox(height: 5,),
        Column(children: const [Text('CODEX HACKATHON',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        Text('A challenge for new deep tech ideas to be developed',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)]),],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/events_background.png'),
            fit: BoxFit.fill,
          )
      ),
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
      child: Column(children: [const Text('UPCOMING EVENTS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 80,),
        blackDeveloper(),
        const SizedBox(height: 50,),
        nextcodeEvolution(),
        const SizedBox(height: 50,),
        nextcodeExtreme(),
        const SizedBox(height: 50,),
        nextcodeHackathon()],),
    );
  }
}
class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return const DesktopView();
      }else { return const MobileView(); }
    });
  }
}