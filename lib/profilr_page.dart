import 'package:flutter/material.dart';
import 'package:portFolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Color(0xFF022C43),
        // appBar: AppBar(
        //   elevation : 0,
        //   backgroundColor: Color(0xFF022C43),
        // ),
        drawer: ResponsiveWidget.isSmallScreen(context) ? Drawer(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              NavButton(
                text: "projects",
                onPressed:(){
                  Navigator.of(context).pushNamed('/project');
                },
              ),
              NavButton(
                text: "contact",
                onPressed:(){},
              )
            ],
          ),
        ): null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds:1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  ProfileInfo(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  SocialInfo(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context) ?
        MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          if(!ResponsiveWidget.isSmallScreen(context))
          Text("abhay1205", style:TextStyle(color: Color(0xFFFFD700))),
          Row(
            children: <Widget>[
              NavButton(
                text: "about",
                onPressed:(){},
              ),
              SizedBox(width: 20,),
              NavButton(
                text: "projects",
                onPressed:(){
                  Navigator.of(context).pushNamed('/project');
                },
              ),
              SizedBox(width: 20,),
              NavButton(
                text: "contact",
                onPressed:(){},
              )
            ],
          )
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {

  final text;
  final onPressed;
  final Color color;
  static const Color clr = Color(0xFF115173);

  const NavButton(
    {
      Key key,
      @required this.text,
      @required this.onPressed,
      this.color = clr,
    }
  ) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: StadiumBorder(),
      splashColor: Color(0xFFFFd700),
      child: Text(text),
      borderSide: BorderSide(
        width: 4,
        color: color
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {

  profileImage(context)=> AnimatedContainer(

    duration: Duration(seconds: 2),
    height: ResponsiveWidget.isSmallScreen(context) ? 
            MediaQuery.of(context).size.height *0.30
            : MediaQuery.of(context).size.height *0.30,
    width: ResponsiveWidget.isSmallScreen(context) ? 
            MediaQuery.of(context).size.height *0.30
            : MediaQuery.of(context).size.height *0.30,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('asset/mas.jpeg'),
        alignment: Alignment.center,
        fit: BoxFit.cover
      )
    ),
  );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Namaste, myself',
      textScaleFactor: 2,
      style: TextStyle(color: Color(0xFFFFd700)),),
      Text(
        "Manu Abhay Singhal",
        textScaleFactor: 5,
        style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10,),
      Text("A guy working and learning to be among the best,\n"
      "I do Mobile App dev with Flutter and backend with nodeJS and firebase\n"
      "Learning new skillset of ML and IoT",
      softWrap: true,
      textScaleFactor: 1.5,
      style: TextStyle(color: Colors.white70)),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("CV", style: TextStyle(color: Color(0xFFFFd700)),),
            color: Color(0xFF115173),
            onPressed: (){},
            padding: EdgeInsets.all(10),
          ),
          SizedBox(width: 20,),
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Say, Hi!!!",  style: TextStyle(color: Color(0xFFFFd700)),),
            color: Color(0xFF053F5E),
            onPressed: (){},
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          profileImage(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
          profileData,
        ],
      ),
      
    );
  }
}
class SocialInfo extends StatelessWidget {

  _launchGithub() async {
  const url = 'https://github.com/abhay1205';
  if (await canLaunch(url)) {
    await launch(url, enableJavaScript: true, forceWebView: true);
  } else {
    throw 'Could not launch $url';
    }
  }

  _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/abhay1205';
    if (await canLaunch(url)) {
      await launch(url, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavButton(text: "GitHub", onPressed: _launchGithub),
              SizedBox(width: 20,),
              NavButton(text: "LinkedIn", onPressed: _launchLinkedIn,),
            ],
          ),
          Text("Manu Abhay Singhal © 2020")
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
              NavButton(text: "GitHub", onPressed: _launchGithub),
              NavButton(text: "LinkedIn", onPressed: _launchLinkedIn,),
              Text("Manu Abhay Singhal © 2020")
        ],
      ),
    );
  }
}