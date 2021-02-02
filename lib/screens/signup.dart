import 'package:flutter/material.dart';
import 'package:loginpage/screens/developerprofile/star.dart';
import 'package:loginpage/service/starApiService.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool password = true;
  TextEditingController _name = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();
  bool confirmPassword = true;
  String status = "";


  void _showSnack(BuildContext context, String title) {
    Scaffold.of(context)
        .showSnackBar(
      SnackBar(
        content: WillPopScope(
          onWillPop: () async {
            Scaffold.of(context).removeCurrentSnackBar();
            return true;
          },
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    )
        .closed
        .then((reason) {
      Navigator.pop(context);
    });
  }

  void _showSnackBar(BuildContext context, String title){
    final snackBar = new SnackBar(
        content: new Text(
          title,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Builder(builder: (context){
        return Container(

          width: queryData.size.width,
          height: queryData.size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/newBg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Wrap(
              children:<Widget> [
                Column(
                  children:<Widget> [

                    Container(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          // padding: EdgeInsets.all(7.0),
                          // radius: 20,
                          child: Image.asset('assets/images/avatar.png'),
                        )
                    ),
                    Padding(padding: EdgeInsets.all(7.0),),

                    //container for name
                    Container(
                      width: 400,
                      child: TextField(
                        controller: _name,
                        maxLength: 15,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)
                            ),
                            labelText: 'Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.green,
                            ),

                            suffixStyle: const TextStyle(color: Colors.green)
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7.0),),

                    //container for username
                    Container(
                      width: 400,
                      child: TextField(
                        controller: _username,
                        inputFormatters: [BlacklistingTextInputFormatter(
                            new RegExp(r"\s\b|\b\s|\s\s|\b\b")
                        )],
                        maxLength: 15,
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
                        inputFormatters: [BlacklistingTextInputFormatter(
                            new RegExp(r"\s\b|\b\s|\s\s|\b\b")
                        )],
                        maxLength:15,
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

                    //container for password
                    Container(
                      width:400,
                      child:TextField(
                        controller: _confirmPassword,
                        inputFormatters: [BlacklistingTextInputFormatter(
                            new RegExp(r"\s\b|\b\s|\s\s|\b\b")
                        )],
                        maxLength:15,
                        obscureText: this.confirmPassword,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)
                            ),
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(
                              Icons.security,
                              color: Colors.green,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  Icons.remove_red_eye,
                                  color: this.confirmPassword? Colors.redAccent:Colors.lightBlue
                              ),
                              onPressed: () {
                                setState(() {
                                  this.confirmPassword = !this.confirmPassword;
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
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        onPressed: () async{
                          if (this._username.text.isNotEmpty && this._name.text.isNotEmpty&&
                              this._confirmPassword.text.isNotEmpty && this._password.text.isNotEmpty){
                            if (this._password.text == this._confirmPassword.text){
                              status = await StarService.createUserService(_username.text, _password.text, _name.text);
                              if (status!=null && status == 'success'){
                                this._showSnack(context, "Account Successfully Created!.");
                              }
                            }else{
                              this._showSnackBar(context, "Password and Confirm Password does not match!.");
                            }
                          }else{
                            this._showSnackBar(context, "All fields required!.");
                          }
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(7.0),),
                  ],
                )
              ],
            ),
          ),
        );
      }),


    );
  }
}
