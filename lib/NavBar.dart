

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nextcode/About.dart';
import 'package:nextcode/Events.dart';
import 'package:nextcode/Home.dart';
import 'package:nextcode/Lab.dart';
import 'package:nextcode/TechTalk.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800)
        {
          return const DesktopNavbar();
        }else { return Container(); }
    });
  }
}
// Colors of NavBar texts
Color home_color = const Color(0xff5092EF);
Color about_color = Colors.white;
Color techtalk_color = Colors.white;
Color events_color = Colors.white;
Color lab_color = Colors.white;

class DesktopNavbar extends StatefulWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  State<DesktopNavbar> createState() => _DesktopNavbarState();
}
class _DesktopNavbarState extends State<DesktopNavbar> {

  // Change of navbar text color from to blue
  navBarColorChange(Color x,Color y,Color z, Color w,Color t)
  {
    setState((){
      home_color = x;
      about_color = y;
      techtalk_color = z;
      events_color = w;
      lab_color = t;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 100,),
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Image.asset('assets/images/Logo.png',height: 100,width: 100,),
          Row(children: [RichText(text: TextSpan(text: 'Home',style: TextStyle(color: home_color,fontWeight: FontWeight.bold,fontSize: 20),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
                navBarColorChange(const Color(0xff5092EF), Colors.white, Colors.white, Colors.white, Colors.white);})),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'About',style:  TextStyle(color: about_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage()),);
                  navBarColorChange(Colors.white, const Color(0xff5092EF), Colors.white, Colors.white, Colors.white);}),),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'TechTalk',style: TextStyle(color: techtalk_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TechTalkPage()),);
                  navBarColorChange(Colors.white, Colors.white, const Color(0xff5092EF), Colors.white, Colors.white);})),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Events',style: TextStyle(color: events_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
                  navBarColorChange(Colors.white, Colors.white, Colors.white, const Color(0xff5092EF), Colors.white);})),
            const SizedBox(width: 20),
            RichText(text: TextSpan(text: 'Lab',style: TextStyle(color: lab_color,fontSize: 20),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LabPage()),);
                  navBarColorChange(Colors.white, Colors.white, Colors.white, Colors.white, const Color(0xff5092EF));}))],)],),
    );
  }
}

// Drawer that contain navbar elements for mobile view
Widget createDrawer(BuildContext context)
{
  return Drawer(
    child: Container(
      color: Colors.black87,
      child: ListView(padding: EdgeInsets.zero,
      children: [
        ListTile(title: const Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
          },),
        ListTile(title: const Text('About',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage()),);
          },),
        ListTile(title: const Text('TechTalk',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TechTalkPage()),);
          },),
        ListTile(title: const Text('Events',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const EventsPage()),);
        },),
        ListTile(title: const Text('Lab',style: TextStyle(color: Colors.white,fontSize: 20)),onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LabPage()),);
        },)
      ],),)
  );
}
