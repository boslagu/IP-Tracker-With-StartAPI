import 'package:flutter/material.dart';

class Rommel extends StatefulWidget {
  @override
  _RommelState createState() => _RommelState();
}

class _RommelState extends State<Rommel> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Developer Profile"),
      ),
      body: Container(
        width: queryData.size.width,
        height: queryData.size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/newBg.png"),
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
                  NetworkImage('https://scontent.fmnl17-2.fna.fbcdn.net/v/t1.0-9/78724582_2735201789856519_7767803655985561600_o.jpg?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeFEL6Cw4OpqMSJjOY7nYUgRvBWpsvI0JZ28Famy8jQlnScxalMoWWWLdwLSicF_S9RIqQR7WFgnimaAlo4rVUPy&_nc_ohc=0uIRgF7-tT4AX_X9wln&_nc_ht=scontent.fmnl17-2.fna&oh=92cc4bc0696afa78b149f2f35bfebf40&oe=603E8568'),
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
