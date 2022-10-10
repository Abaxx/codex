

import 'dart:html';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:nextcode/Home.dart';

import 'About.dart';
import 'NavBar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: [Nav(),ContactForm(),Footer()],))
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
            body:  SingleChildScrollView(child: Column(children: [Nav(),ContactForm(),Footer()],))
        );
      }
    });
  }
}

class ContactForm extends StatelessWidget {

  ContactForm({Key? key}) : super(key: key);


  // contents of contact
  contents(BuildContext context)
  {
    return Column(
      children: [
        const Text('Get in Touch!',style: TextStyle(color: Color(0xff40454A),fontSize: 20,fontWeight: FontWeight.bold),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Text('First Name',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Last Name',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Email',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Subject',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Message',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
              child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10),),),maxLines: 15,),),
            const SizedBox(height: 20,),
          ],),
        MaterialButton(onPressed: (){},color: const Color(0xff5092EF),minWidth: 200,height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Text('Send message',style: TextStyle(color: Colors.white),),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          //height: 300,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: contents(context),
        );
  }
}
