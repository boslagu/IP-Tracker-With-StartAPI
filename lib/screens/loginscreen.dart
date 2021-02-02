import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/apiscreen.dart';
import 'developerprofile/replan.dart';
import 'developerprofile/star.dart';
import 'developerprofile/rommel.dart';
import 'developerprofile/necir.dart';
import 'signup.dart';
import 'package:loginpage/service/starApiService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool password= true;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String token = "";

//ito ang menu ng drawer
  List<String> _myList = ["sir Replan","sir Star","sir Rommel","Si SIr Necir lang malakas"];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      //ito yung List sa left side
      drawer: Drawer(
          child: ListView.builder(
              itemCount: (_myList.length),
              itemBuilder: (context, i){
                return _myList[i].isNotEmpty
                    ? ListTile(
                  title: Text(_myList[i].toString()),
                  onTap: (){

                    //ito ang pag pili ng text screen
                    if (_myList[i].toString() == "sir Replan"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Replan()),
                      );
                    }else if (_myList[i].toString() == "sir Star"){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Star()),
                      );
                    }else if (_myList[i].toString() == "sir Rommel") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Rommel()),
                      );
                    }else if (_myList[i].toString() == "Si SIr Necir lang malakas") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Necir()),
                      );
                    };
                  },
                )
                    : Container(
                  height: 0,
                  width: 0,
                );
              }
          )
      ),
      appBar: AppBar(
        centerTitle:true,
        title: Text(
            "Login",
          textAlign: TextAlign.center,
        ),
      ),
      body:Container(
        width: queryData.size.width,
        height: queryData.size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(9.0),),

                  //container for username
                  Container(
                    width: 400,
                    child: TextField(
                      controller: _username,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)
                          ),
                          labelText: 'Username',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.green,
                          ),

                          suffixStyle: const TextStyle(color: Colors.green)
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(7.0),),

                  //container for password
                  Container(
                    width:400,
                    child:TextField(
                      controller: _password,
                      obscureText: this.password,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)
                          ),
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.security,
                            color: Colors.green,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                Icons.remove_red_eye,
                                color: this.password? Colors.redAccent:Colors.lightBlue
                            ),
                            onPressed: () {
                              setState(() {
                                this.password = !this.password;
                              });
                            },
                          ),

                          suffixStyle: const TextStyle(color: Colors.green)
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0),),

                  //container for button sign in
                  Container(
                    width: 300,
                    height: 50,
                    child:RaisedButton(
                      color: Colors.blue,
                      child: Text(
                          "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      onPressed: ()async{
                        token = await StarService.signUserService(_username.text, _password.text);
                        if (token!= null){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ApiScreen(token)),
                          );
                        }
                      },
                    ),
                  ),
                 Padding(padding: EdgeInsets.all(7.0),),

                  //container for button sign up
                  Container(
                    width: 80,
                    height: 50,
                    margin: EdgeInsets.only(left: (queryData.size.width) /1.7),
                    child:InkWell(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    )
                  )
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
