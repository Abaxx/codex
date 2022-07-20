

import 'package:flutter/material.dart';

class JoinPopUp extends StatelessWidget {

  // contents of Join popup
  contents(BuildContext context)
  {
    return Column(
      children: [
        Text('Join Deep Tech Africa',style: TextStyle(color: Color(0xff40454A),fontSize: 20,fontWeight: FontWeight.bold),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('First Name',style: TextStyle(color: Color(0xff40454A),)),
          SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
            child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
          Text('Last Name',style: TextStyle(color: Color(0xff40454A),)),
          SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
            child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
          Text('Country',style: TextStyle(color: Color(0xff40454A),)),
          SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
            child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
          Text('Technology Track',style: TextStyle(color: Color(0xff40454A),)),
          SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
            child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
          Text('Email',style: TextStyle(color: Color(0xff40454A),)),
          SizedBox(width: 0.5 * MediaQuery.of(context).size.width,
            child: TextField(decoration: InputDecoration(fillColor: Colors.white,filled: true,
              border: OutlineInputBorder(borderSide: BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
        ],),
        MaterialButton(onPressed: (){},color: const Color(0xff5092EF),minWidth: 400,height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Text('Join',style: TextStyle(color: Colors.white),),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //height: 300,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: contents(context),
    ));
  }
}