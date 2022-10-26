
import 'package:appwrite/appwrite.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:codex/About.dart';
import 'package:codex/Contact.dart';
import 'package:codex/NavBar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        // Desktop View
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),ProgramSection(),CodeTalkSection(),SponsorshipSection(),Footer()],))
        );
      }else{ //Mobile View
        return Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/Logo.png',height: 50,width: 80,),
            centerTitle: true,
          ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),ProgramSection(),CodeTalkSection(),SponsorshipSection(),Footer()],))
        );
      }
    });
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  desktopView(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text('African Technology Distrupt',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50,),),
        Padding(padding: const EdgeInsets.only(top: 10),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Column(
            children: [RichText(text: const TextSpan(text:'CODE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60,fontFamily: "Teko"),
              children: [TextSpan(text: 'X',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 80,fontFamily: "Teko"))]),textAlign: TextAlign.center,),
              const Text("AFRICA\n 2023",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60,fontFamily: "Teko"),textAlign: TextAlign.center,),
              MaterialButton(onPressed: (){
                //url to join Nextcode Africa 2023
                final url = Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSf6YFtYlzg_CtzK_X4FfMws8EtR5C0l6BBT09IG-Pd3uc0vjA/viewform?usp=sf_link");
                launchUrl(url);
              },color: const Color(0xff5092EF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text('Join',style: TextStyle(color: Colors.white,),),)],),
            Image.asset('assets/images/africa_tech_map.png',height: 400,width: 400,)],))
      ],);
  }
  mobileView()
  {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text('African Technology Distrupt',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        Column(
            children: [const SizedBox(height: 10,),
              RichText(text: const TextSpan(text:'CODE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40,fontFamily: "Teko"),
              children: [TextSpan(text: 'X',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50,fontFamily: "Teko"))]),textAlign: TextAlign.center,),
              const Text("AFRICA\n 2023",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40,fontFamily: "Teko"),textAlign: TextAlign.center,),
              const SizedBox(height: 5,),
              MaterialButton(onPressed: (){//url to join Nextcode Africa 2023
                final url = Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSf6YFtYlzg_CtzK_X4FfMws8EtR5C0l6BBT09IG-Pd3uc0vjA/viewform?usp=sf_link");
                launchUrl(url);
                },color: const Color(0xff5092EF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text('Join',style: TextStyle(color: Colors.white),),),
              const SizedBox(height: 20,),],),
            Image.asset('assets/images/africa_tech_map.png',height: 280,width: 250,)],)
            );
  }
  // Hero Section
  section()
  {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return desktopView(context);
      }else {return mobileView();}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/developer.png'),
          fit: BoxFit.fill
        )
      ),
      child: Column(children: [const Navbar(),section()],),
    );
  }
}

class ProgramSection extends StatelessWidget {
  const ProgramSection({Key? key}) : super(key: key);

  program()
  {
    return Container(
      height: 250,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: const Color(0xff5092EF),
          width: 3,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [const SizedBox(height: 20,),
          const Text('Programs',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' BLACK DEVELOPERS CONFERENCE',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),)]),
            const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' CODEX EVOLUTION',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),
            const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' CODEX HACKATHON',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),
            const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' CODEX EXTREME',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),]
        )],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/devconf.png'),
                fit: BoxFit.fill
            )
        ),
        padding: const EdgeInsets.only(left: 100),
        alignment: Alignment.centerLeft,
        child: program(),
      ),);
      }else {
        return Padding(padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/devconf.png'),
                fit: BoxFit.fill
            )
        ),
        alignment: Alignment.center,
        child: program(),
      ),);
      }
    });
  }
}

class CodeTalkSection extends StatelessWidget {
  const CodeTalkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/images/codetalk.png'),
    );
  }
}

class SponsorshipSection extends StatelessWidget {
  const SponsorshipSection({Key? key}) : super(key: key);

  Padding content(BuildContext context)
  {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      child: Column(
        children: [const Text('Sponsorships and partnerships',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
          const SizedBox(height: 10,),
          const Text('There are several opportunities for you to engage with attendees at each of our programs or events.',style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "Poppins-SemiBold"),textAlign: TextAlign.center,),
          RichText(text: TextSpan(text:'Contact us ',style: const TextStyle(color: Color(0xff5092EF),fontStyle: FontStyle.italic,fontSize: 15),recognizer: TapGestureRecognizer()..onTap = (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ContactPage(),));},
              children: const [TextSpan(text: ' for more information.',style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal))]),)],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sponsor.png'),
          fit: BoxFit.fill
        )
      ),
      child: content(context),
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer> {

  // Appwrite database access
  late Client client;
  late Databases databases;


  @override
  initState(){
    super.initState();

    client = Client().setEndpoint('https://localhost/v1').setProject('34d22bfbab52658bf76');
    databases = Databases(client);
    
  }

// Adding subscribers email addresses to database
  void createData(String email_address) async {
    try {
      if(email_address.isEmpty){
      setState(() {
        message = "Email can not be empty";
      });
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(email_address)){
      setState(() {
        message = "Invalid Email Address";
      });
    }else{
        await databases.createDocument(
        databaseId: "634d234d8d4a80a2691f", collectionId: "634d2359e93f7024db25",documentId: 'unique()',data: {'Emails': email_address});
      
        message = "Sent Successful";
    }
    } on AppwriteException catch(e) {
      //print(e.message);
    }

  }

// Validate Newsletter email address before submit.
String? message;
validateEmail(String email){

    if(email.isEmpty){
      setState(() {
        message = "Email can not be empty";
      });
    }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(email)){
      setState(() {
        message = "Invalid Email Address";
      });
    }else{
      setState(() {
        //createData(email);
        message = "Not yet available";
      });
    }
  }
  
  Column leftContents(BuildContext context,CrossAxisAlignment alignment,bool mobileView)
  {
    Widget textWidget = RichText(text: const TextSpan(text:'CODE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Teko"),
              children: [TextSpan(text: 'X',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40,fontFamily: "Teko"))]),);
    if(mobileView == false){
      textWidget= const Text("");
    }
    return Column(
      crossAxisAlignment: alignment,
      children: [RichText(text: TextSpan(text: 'About us',style: TextStyle(color: Colors.white),
        recognizer: TapGestureRecognizer()..onTap = (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AboutPage(),));})),
        const SizedBox(height: 15,),
        RichText(text: TextSpan(text: 'Contact us',style: TextStyle(color: Colors.white),
            recognizer: TapGestureRecognizer()..onTap = (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const ContactPage(),));})),
        const SizedBox(height: 15,),
        RichText(text: const TextSpan(text: 'Sponsors',style: TextStyle(color: Colors.white),)),
        const SizedBox(height: 30,),
        textWidget,],
    );
  }

  Column centerContents(BuildContext context,double size)
  {
    final emailController = TextEditingController();
    return Column(
      children: [const Text('Join Our Newsletter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 5,),
        SizedBox(width: size * MediaQuery.of(context).size.width,
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Your Email',fillColor: Colors.white,filled: true,),
              controller: emailController,
              ), ),
        const SizedBox(height: 10,),
      MaterialButton(onPressed: (){
        validateEmail(emailController.text);
        //createData(emailController.text);
        final snackBar = SnackBar(content: Text(message!,style: const TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        
      },
      color: const Color(0xff5092EF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const Text('Subscribe',style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal),),),
        const SizedBox(height: 30,),],
    );
  }

  Column rightContents(CrossAxisAlignment alignment)
  {
    return Column(
      crossAxisAlignment: alignment,
      children: [const Text('Follow us on',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-Regular'),),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.instagram,color: Colors.white,size: 20,)),
          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.facebook,color: Colors.white,size: 20,)),
          IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.twitter,color: Colors.white,size: 20,))],),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: const [FaIcon(FontAwesomeIcons.phone,color: Colors.white,size: 15,),Text('  +2348079279899',style: TextStyle(color: Colors.white),),]),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: const [FaIcon(FontAwesomeIcons.envelope,color: Colors.white,size: 15,),Text('  hello@codexafrica.com',style: TextStyle(color: Colors.white),),]),
        const SizedBox(height: 50,),
        const Text('\u00a9 2022 CODEX AFRICA',style: TextStyle(color: Colors.white,fontSize: 15),),],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff223745),
      padding: const EdgeInsets.symmetric(vertical: 40),
      margin: const EdgeInsets.only(top: 5),
      child: LayoutBuilder(builder: (context,constraints){
        //Desktop view of footer
      if(constraints.biggest.width > 800){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [leftContents(context,CrossAxisAlignment.start,true),centerContents(context,0.2),rightContents(CrossAxisAlignment.start)],);
      }// Mobile view of footer
      else {return Column(children: [leftContents(context,CrossAxisAlignment.center,false),centerContents(context,0.5),rightContents(CrossAxisAlignment.center)],);}
    }),
    );
    
  }
}