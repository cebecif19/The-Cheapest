import 'package:enucuzuproject/HomePage.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();

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
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: screenSize.height * 0.14),
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          fontFamily: "fontsFamily",
                          fontSize: screenSize.width * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.08,
                        vertical: screenSize.height * 0.02,
                      ),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70, // Arka planla uyumlu çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Odaklandığında çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.black45.withOpacity(0.3), // Giriş alanı arka planı
                        ),
                        style: TextStyle(color: Colors.white), // Metin rengi
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.08,
                        vertical: screenSize.height * 0.02,
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70, // Arka planla uyumlu çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Odaklandığında çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.black45.withOpacity(0.3), // Giriş alanı arka planı
                        ),
                        style: TextStyle(color: Colors.white), // Metin rengi
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.08,
                        vertical: screenSize.height * 0.02,
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70, // Arka planla uyumlu çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Odaklandığında çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.black45.withOpacity(0.3), // Giriş alanı arka planı
                        ),
                        style: TextStyle(color: Colors.white), // Metin rengi
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.08,
                        vertical: screenSize.height * 0.02,
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: passwordAgainController,
                        decoration: InputDecoration(
                          labelText: "Password again",
                          labelStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70, // Arka planla uyumlu çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white, // Odaklandığında çerçeve rengi
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.black45.withOpacity(0.3), // Giriş alanı arka planı
                        ),
                        style: TextStyle(color: Colors.white), // Metin rengi
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Eğer password ile password again uyuşuyorsa üyelik işlemi gerçekleştirilmiş olacak.
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black45.withOpacity(0.3), // Arka plan rengi
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.white70, // Çerçeve rengi
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.03,
                          horizontal: screenSize.width * 0.1,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.08),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.06,
              left: screenSize.width * 0.05,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop(); // Önceki sayfaya dönmek için pop() kullanılıyor
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
