
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nextcode/About.dart';
import 'package:nextcode/Contact.dart';
import 'package:nextcode/Join.dart';
import 'package:nextcode/NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.biggest.width > 800){
        // Desktop View
        return Scaffold(
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),ProgramSection(),TechTalkSection(),SponsorshipSection(),Footer()],))
        );
      }else{ //Mobile View
        return Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/Logo.png',height: 80,width: 80,),
            centerTitle: true,
          ),
            drawer: createDrawer(context),
            body:  SingleChildScrollView(child: Column(children: const [HeroSection(),ProgramSection(),TechTalkSection(),SponsorshipSection(),Footer()],))
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
            children: [const Text('NEXTCODE\n AFRICA\n 2023',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45),textAlign: TextAlign.center,),
              MaterialButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> JoinPopUp()),);},color: const Color(0xff5092EF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text('Join',style: TextStyle(color: Colors.white,),),)],),
            Image.asset('assets/images/africa_tech_map.png',height: 400,width: 400,)],))
      ],);
  }
  mobileView()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text('African Technology Distrupt',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
        Column(
            children: [const SizedBox(height: 10,),
              const Text('NEXTCODE\n AFRICA\n 2023',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,),
              const SizedBox(height: 5,),
              MaterialButton(onPressed: (){},color: const Color(0xff5092EF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text('Join',style: TextStyle(color: Colors.white),),),
              const SizedBox(height: 20,),],),
            Image.asset('assets/images/africa_tech_map.png',height: 280,width: 250,)],);
  }
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
      width: 300,
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
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' NEXTCODE EVOLUTION',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),
            const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' NEXTCODE HACKATHON {NEXTHACK}',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),
            const SizedBox(height: 10,),
            Row(children: [Image.asset('assets/images/arrow.png',height: 20,width: 20,),const Text(' NEXTCODE EXTREME',style: TextStyle(color: Colors.white,fontFamily: 'Poppins-SemiBold',fontSize: 15),),]),]
        )],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
  }
}

class TechTalkSection extends StatelessWidget {
  const TechTalkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/images/techtalk.png'),
    );
  }
}

class SponsorshipSection extends StatelessWidget {
  const SponsorshipSection({Key? key}) : super(key: key);

  Padding content(BuildContext context)
  {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Column(
        children: [const Text('Sponsorships and partnerships',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          const SizedBox(height: 10,),
          const Text('There are several opportunities for you to engage with attendees at each of our programs or events.',style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.center,),
          RichText(text: TextSpan(text:'Contact us ',style: TextStyle(color: Color(0xff5092EF),fontStyle: FontStyle.italic,fontSize: 15),recognizer: TapGestureRecognizer()..onTap = (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const ContactPage(),));},
              children: [TextSpan(text: ' for more information.',style: TextStyle(color: Colors.white,fontStyle: FontStyle.normal))]),)],
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

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);
  
  Column leftContents(BuildContext context,CrossAxisAlignment alignment,bool x)
  {
    String txt='NEXTCODE';
    if(x==false){
      txt = '';
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
        Text(txt,style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),],
    );
  }

  Column centerContents(BuildContext context,double size)
  {
    return Column(
      children: [const Text('Join Our Newsletter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        const SizedBox(height: 5,),
        SizedBox(width: size * MediaQuery.of(context).size.width,
          child: const TextField(decoration: InputDecoration(labelText: 'Your Email',fillColor: Colors.white,filled: true,),),),
        const SizedBox(height: 10,),
      MaterialButton(onPressed: (){},color: const Color(0xff5092EF),
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
            children: const [FaIcon(FontAwesomeIcons.envelope,color: Colors.white,size: 15,),Text('  hello@nextcodeafrica.com',style: TextStyle(color: Colors.white),),]),
        const SizedBox(height: 50,),
        const Text('\u00a9 2022 NEXTCODE AFRICA',style: TextStyle(color: Colors.white,fontSize: 15),),],
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