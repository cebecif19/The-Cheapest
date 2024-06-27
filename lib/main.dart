import 'package:enucuzuproject/LoginPage.dart';
import 'package:enucuzuproject/SignupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1f50be)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1f50be), Colors.black38],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width * 0.2,
                  top: screenSize.height * 0.02,
                  bottom: screenSize.height * 0.02,
                ),
                child: Text(
                  "Cheapest for",
                  style: TextStyle(
                    fontFamily: "fontsFamily",
                    fontSize: screenSize.width * 0.1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width * 0.2,
                  top: screenSize.height * 0.02,
                  bottom: screenSize.height * 0.02,
                ),
                child: Text(
                  "Everyone",
                  style: TextStyle(
                    fontFamily: "fontsFamily",
                    fontSize: screenSize.width * 0.1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: screenSize.width * 0.2,
                  top: screenSize.height * 0.02,
                  bottom: screenSize.height * 0.08,
                ),
                child: Text(
                  "Let's start!",
                  style: TextStyle(
                    fontFamily: "fontsFamily",
                    fontSize: screenSize.width * 0.1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize.height * 0.12,
                  right: screenSize.width * 0.1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06,
                          vertical: screenSize.height * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black87, width: 2.0),
                        ),
                      ),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontFamily: "fontsFamily",
                          color: Color(0xff1f50be),
                          fontSize: screenSize.width * 0.05,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.06,
                          vertical: screenSize.height * 0.02,
                        ),
                        backgroundColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontFamily: "fontsFamily",
                          fontSize: screenSize.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
