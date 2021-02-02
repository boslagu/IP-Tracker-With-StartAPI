import 'package:flutter/material.dart';

class Necir extends StatefulWidget {
  @override
  _NecirState createState() => _NecirState();
}

class _NecirState extends State<Necir> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar:AppBar(
        title: Text("Developer Profile"),
      ),
      body: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15.0),),
              Container(
                height: 150,
                width: 150,
                child: CircleAvatar(
                  radius:30,
                  backgroundImage:
                  NetworkImage('https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-9/82282773_1513508532130079_4311214143668486144_n.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeH77oAOncoQVtOfWpH0iFi5Gywzzg3TTIgbLDPODdNMiLKofMGizXFpwL7bDo9h950ANh1irHcVQfjcFJjOZKol&_nc_ohc=YnlqH0RhpgsAX9Yvcla&_nc_ht=scontent.fmnl17-1.fna&oh=08b43999497dd350b1fe61a6db13320f&oe=603E3D8D'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          ),
        ),
      );
  }
}
