import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/top.png',
                width: size.width,
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/botton.png',
                  width: size.width,
              )
            ) 
          ],
        )
      );
    
  }
}