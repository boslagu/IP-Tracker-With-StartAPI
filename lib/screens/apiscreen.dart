import 'package:flutter/material.dart';
import 'package:loginpage/service/starApiService.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiScreen extends StatefulWidget {
  String token;

  ApiScreen(this.token);

  @override
  _ApiScreenState createState() => _ApiScreenState(this.token);
}

class _ApiScreenState extends State<ApiScreen> {
  String token;

  _ApiScreenState(this.token);

  List<String> _ipList = [];
  List<String> _ipNames = [];
  TextEditingController _IpName = new TextEditingController();
  TextEditingController _data = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
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
            children: <Widget>[

              Padding(padding: EdgeInsets.all(22.0),),
              Container(
                width: (queryData.size.width * .7),
                child: TextField(
                  controller: _IpName,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                      labelText: 'IP Name',
                      prefixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),

                      suffixStyle: const TextStyle(color: Colors.green)
                  ),
                ),

              ),
              Padding(padding: EdgeInsets.all(8.0),),
              Container(
                width: (queryData.size.width * .7),
                child: TextField(
                  controller: _data,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)
                      ),
                      labelText: 'IP or Domain',
                      prefixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),

                      suffixStyle: const TextStyle(color: Colors.green)
                  ),

                ),
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              Container(
                height: (queryData.size.width * .08),
                width: (queryData.size.width * .7),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Generate IP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  onPressed: ()async{
                    String _responseUrl = await StarService.locatorService(_data.text, token);
                    setState(() {
                      _ipNames.add(_IpName.text);
                      _ipList.add(_responseUrl);
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),),
              Container(
                height:22,
                width: 70,
                margin:EdgeInsets.only (right:(queryData.size.width * .75)),
                child: Text(
                    "IP List",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
              ),
              Padding(padding: EdgeInsets.all(9.0),),
              Container(
                width: (queryData.size.width * .9),
                height: (queryData.size.height * .6),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: _ipNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: InkWell(
                          onTap: ()async{
                            if (await canLaunch(_ipList[index])) {
                            await launch(_ipList[index]);
                          } else {
                            throw 'Could not launch ' + _ipList[index];
                          }
                            print(_ipNames[index]);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _ipNames[index],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          ),
                        )
                    );




                    // return ListTile(
                    //   title: Text(_ipNames[index]),
                    //   subtitle: Text(_ipList[index]),
                    //   onTap: (){
                    //     print(_ipNames[index]);
                    //   },
                    // );

                    // return GestureDetector(
                    //   child: Text(index.toString()),
                    //   onTap: () => Scaffold
                    //       .of(context)
                    //       .showSnackBar(SnackBar(content: Text(index.toString()))),
                    // );

                    // return Container(
                    //   height: 50,
                    //   color: Colors.blue[200],
                    //   child: Center(child: Text(_ipNames[index])),
                    // );


                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
