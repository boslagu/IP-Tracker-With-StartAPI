import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Star extends StatefulWidget {
  @override
  _StarState createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
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
              Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top:70.0, left:20.0,right:20.0),
                    child: Container(
                      decoration:BoxDecoration(
                        boxShadow:
                        [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.all(Radius.circular(20.0),
                        ),
                      ),
                    width: double.infinity ,
                    height:queryData.size.height* .75,

                ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            radius:30,
                            backgroundImage:
                            NetworkImage('https://scontent.fmnl17-3.fna.fbcdn.net/v/t1.0-9/1376539_640779282609399_1433407097_n.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeEujCjI3rnR5dg-J3CWYamNA2vQGNxziPMDa9AY3HOI80ig2DRSQEi7Qt0LegEON300HGSkNFGs5P7Cy38lS3j9&_nc_ohc=Nh_d6no0UBwAX-LkUh3&_nc_ht=scontent.fmnl17-3.fna&oh=9a81632b738f67ec566ded2f1664ca4b&oe=603C6213'),
                            backgroundColor: Colors.transparent,
                          ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
