import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  Random random = Random();

  List<Color> colors = [Colors.purple, Colors.red, Colors.yellow, Colors.blueAccent];
  BorderRadiusGeometry _border = BorderRadius.circular(8.0);

  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.purple;
  int indexColor = 0;

  void changeColor(){
    indexColor = random.nextInt(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: AnimatedContainer(
          curve: Curves.decelerate,
          duration: Duration(milliseconds: 600),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _border,
            color: _color,
            // color: colors[indexColor],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(255), 
              random.nextInt(255), 
              random.nextInt(255), 1);
            _border = BorderRadius.circular(random.nextInt(40).toDouble());
            // changeColor();
          });
        },
        child: Icon(Icons.play_arrow,)
      ),
    );
  }

  

}