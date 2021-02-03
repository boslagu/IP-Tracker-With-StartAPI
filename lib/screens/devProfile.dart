import 'package:flutter/material.dart';
import 'package:loginpage/service/githubApiService.dart';
import 'package:loginpage/service/responseStructure/githubResponseStructure.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Replan extends StatefulWidget {
  String username;
  Replan(this.username);
  @override
  _ReplanState createState() => _ReplanState(this.username);
}

class _ReplanState extends State<Replan> {
  String username;
  _ReplanState(this.username);

  Future <GithubResponseStructure> userDetails;
  List<ReposResponseStructure> repos;
  List repoName = [];
  List repoUrl = [];
  String name, bio;

  void getRepo() async{
    repos = await GithubAPI.getRepos(username);
    for(var repo in repos) {
      setState(() {
        repoName.add(repo.name);
        repoUrl.add(repo.url);
      });
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    setState(() {
      userDetails = GithubAPI.getUser(username);
      userDetails.then((value) => (
          getRepo()
      )
      );
      // repos.then((value) => print(value[0].name));
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(queryData.textScaleFactor);
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text("Developer Profile"),
      ) ,
      body: FutureBuilder<GithubResponseStructure>(
        future: userDetails,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return
          //      --------------
              Container(
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
                                  snapshot.data.name,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // AutoSizeText(
                                //   "Bio: "+ snapshot.data.bio,
                                //   style: TextStyle(
                                //     fontSize:30,
                                //   ),
                                //   maxLines: 2,
                                //     overflow: TextOverflow.ellipsis
                                // ),

                              ],
                            ),

                          ),
                          Padding(
                            padding: EdgeInsets.only(top:(queryData.size.width*.5)),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    width: (queryData.size.width*.85),
                                    child: new Text(
                                      snapshot.data.bio,
                                      style: TextStyle(
                                        fontSize:22,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.only(top:queryData.size.height * .40),
                            child: Center(
                              child: Container(
                                height: queryData.size.height * .40,
                                width: queryData.size.width * .9,
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: repoName.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
                                        child: InkWell(
                                          onLongPress: (){
                                            //on long press
                                          },
                                          onTap: (){
                                            //on tap
                                          },
                                          child: Container(
                                            color: Colors.blue[100],
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    repoName[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Padding(padding: EdgeInsets.all(6.0),),
                                                  Text(
                                                    repoUrl[index],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left:(queryData.size.width*.07),top:(queryData.size.height /3.2) ),
                          //   child: Row(
                          //     // mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         "Repositories:",
                          //         style: TextStyle(
                          //           fontSize:30,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //
                          // ),
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
                                  NetworkImage(snapshot.data.avatar),
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
              );
          //      --------------
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}

//