

import 'package:flutter/material.dart';
import 'package:nextcode/Home.dart';

import 'About.dart';
import 'NavBar.dart';

class LabPage extends StatelessWidget {
  const LabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Header(),LabForm(),Footer()],))
        );
      }else{
        return Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/images/Logo.png',height: 80,width: 80,),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [Nav(),Header(),LabForm(),Footer()],))
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
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/lab_header1.png'),
              fit: BoxFit.fill
          )
      ),
      padding: EdgeInsets.symmetric(vertical: 70),
      child: LayoutBuilder(builder: (context,constraints){
        if(constraints.biggest.width > 800){
          return Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: const [Text('Where Deep Technology Grows',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
            Text('LOADING.............',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)]));
        }else { return Center(child: Column(children: const [Text('Where Deep Technology Grows',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          Text('LOADING.............',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),)]));}
      }),
    );
  }
}

class LabForm extends StatelessWidget {
  const LabForm({Key? key}) : super(key: key);

  // Return images
  desktopViewContent()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/robot.png'),fit: BoxFit.fill),
    borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,),
            Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/ai.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,)],
        ),const SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/spaceship.png'),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,),
            Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/driveless.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,)],
        ),const SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/drone.png'),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,),
            Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/vr.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 300,width: 300,)],
        )
      ],
    );
  }

  mobileViewContent()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/robot.png'),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
        const SizedBox(height: 50,),
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/ai.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
        const SizedBox(height: 50,),
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/spaceship.png'),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
        const SizedBox(height: 50,),
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/driveless.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
        const SizedBox(height: 50,),
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/drone.png'),fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
        const SizedBox(height: 50,),
        Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/vr.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(100)),),height: 200,width: 200,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 700,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/techtalk_background.png'),
              fit: BoxFit.fill
          )
      ),
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: LayoutBuilder(builder: (context,constraints){
        if(constraints.biggest.width > 800){
          return desktopViewContent();
        }else { return mobileViewContent();}
      }),
    );
  }
}