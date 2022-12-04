
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:codex/Home.dart';
import 'package:http/http.dart' as http;

import 'About.dart';
import 'NavBar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: [Nav(),Contact(),Footer()],))
        );
      }else{
        return Scaffold(
            appBar: AppBar(
              title: GestureDetector(child: Image.asset('assets/images/Logo.png',height: 50,width: 80,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()),);
              },),
              centerTitle: true,
            ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: [Nav(),Contact(),Footer()],))
        );
      }
    });
  }
}

class Contact extends StatefulWidget {

  const Contact({Key? key}) : super(key: key);

  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<Contact>{

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();


  String? snackMessage;

  Future sendEmail(String firstName, String lastName, String email, String subject, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_kmfvtdn';
  const templateId = 'template_hqq60yy';
  const publicKey = 'bSmZwBLDMAiJkxNLy';
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},//This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          // ignore: prefer_interpolation_to_compose_strings
          'first_name': firstName,
          'last_name': lastName,
          'from_email': email,
          'subject' : subject,
          'message': message,
          'company': "CodeX Africa"
        }
      }));
  return response.statusCode;
}

  // contents of contact
  contents(BuildContext context, double size)
  {
    return Column(
      children: [
        const Text('Get in Touch!',style: TextStyle(color: Color(0xff40454A),fontSize: 20,fontWeight: FontWeight.bold),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const Text('First Name',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: size * MediaQuery.of(context).size.width,
              child: TextField(
                controller: firstNameController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Last Name',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: size * MediaQuery.of(context).size.width,
              child: TextField(
                controller: lastNameController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Email',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: size * MediaQuery.of(context).size.width,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Subject',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: size * MediaQuery.of(context).size.width,
              child: TextField(
                controller: subjectController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10)),),),),
            const SizedBox(height: 20,),
            const Text('Message',style: TextStyle(color: Color(0xff40454A),)),
            SizedBox(width: size * MediaQuery.of(context).size.width,
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                border: OutlineInputBorder(borderSide: const BorderSide(width: 2),borderRadius: BorderRadius.circular(10),),),maxLines: 15,),),
            const SizedBox(height: 20,),
          ],),
        MaterialButton(onPressed: () async {

          //validateEmail(emailController.text);

          if(firstNameController.text.isEmpty){
            snackMessage = "Enter First Name";
          }else if(lastNameController.text.isEmpty){
            snackMessage = "Enter Last Name";
          }else if(emailController.text.isEmpty){
            snackMessage = "Enter Email Address";
          }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(emailController.text)){
              setState(() {
            snackMessage = "Invalid Email Address";
             });
          }else if(subjectController.text.isEmpty){
            snackMessage = "Enter Subject";
          }else if(messageController.text.isEmpty){
            snackMessage = "Enter message";
          }else{
            final response = await sendEmail(
              firstNameController.text, lastNameController.value.text, emailController.text, subjectController.text, messageController.text);
              if(response == 200){
                snackMessage = "Message Sent!";
                firstNameController.clear();
                lastNameController.clear();
                emailController.clear();
                subjectController.clear();
                messageController.clear();
              }else {
                snackMessage = " Failed to send message!";
              }
          }
        final snackBar = SnackBar(content: Text(snackMessage!,style: const TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        },
        color: const Color(0xff5092EF),minWidth: 200,height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Text('Send message',style: TextStyle(color: Colors.white),),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Container(
          //height: 300,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: contents(context,0.5)
        );
      }else {
        return Container(
          //height: 300,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: contents(context,0.8),
        );
         }
    }); 
  }
}
