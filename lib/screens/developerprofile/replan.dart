import 'package:flutter/material.dart';

class Replan extends StatefulWidget {
  @override
  _ReplanState createState() => _ReplanState();
}

class _ReplanState extends State<Replan> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(queryData.textScaleFactor);
    return Scaffold(
      appBar:AppBar(
        title: Text("Developer Profile"),
      ) ,
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
          child:
            Column(
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
                          color: Colors.blue[50].withOpacity(.7),
                          borderRadius: BorderRadius.all(Radius.circular(20.0),
                          ),
                        ),
                        width: double.infinity ,
                        height:queryData.size.height* .75,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:(queryData.textScaleFactor),top:(queryData.size.height /5) ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ron Arnold B. Replan",
                            style: TextStyle(
                              fontSize:30,
                            ),
                          ),
                        ],
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.only(left:(queryData.size.width*.07),top:(queryData.size.height /3.7) ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bio:",
                            style: TextStyle(
                              fontSize:30,
                            ),
                          ),
                        ],
                      ),

                    ),

                    Padding(
                      padding: EdgeInsets.only(left:(queryData.size.width*.07),top:(queryData.size.height /3.2) ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Repositories:",
                            style: TextStyle(
                              fontSize:30,
                            ),
                          ),
                        ],
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            child:Container(),
                            radius:30,
                            backgroundImage:
                            NetworkImage('https://scontent.fmnl17-4.fna.fbcdn.net/v/t1.0-9/137517570_4429011483792298_1110825390469993947_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeFZ3pZ2HDePNDW71i55exzGIbV-3qk-PyghtX7eqT4_KOk-8-aVEoTYE6OVPgGQEY0RhC6UF-_2jPqDmoQOlrvA&_nc_ohc=ToKIo04UmHYAX9ZK1yt&_nc_ht=scontent.fmnl17-4.fna&oh=a260272a8b0e88ec06b21d5e4495e057&oe=603C9CE2'),
                            backgroundColor: Colors.transparent,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow:[
                              BoxShadow(
                                color:Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius:8,
                                offset: Offset(0,1.5),
                              )
                            ],
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

//