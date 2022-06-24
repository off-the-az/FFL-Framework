// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

/*

	Test variant how to work on this system using back/front - end connection
	Pls read README files before u will start work with framework
	
*/

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '/framework/back-end%20connection/Global%20DB/Requests.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Phoenix( child: Main())); 
}

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  var jsonData = []; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async{
    jsonData = ApiService(
      request_type: "get",
      url: "https://mykovel.pp.ua/api2/dev/users?token=null"
    ) as List<dynamic>;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: jsonData.length, 
          itemBuilder: (BuildContext context, int i) {
            var post = jsonData[i]; 
            return Padding(
              padding: EdgeInsets.all(15),
              child: Text(post['name']),
            );
          },
        ),
      ),
    );
  }
}
