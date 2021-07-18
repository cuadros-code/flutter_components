import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100;

  bool _valueCheck  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Slider'),
         backgroundColor: Colors.teal,
         centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      // divisions: 20,
      activeColor: Colors.teal,
      label: 'Tamaño de imagen',
      value: _valorSlider,
      min: 100,
      max: 300,
      onChanged: _valueCheck 
      ?  null
      : ( double value ) => actionSlider(value)
    );
  }

  void actionSlider( double value  ){
    setState(() {
      _valorSlider = value;
    });
  }

  Widget _crearImagen() {
    return Image(
      width: _valorSlider * 2,
      fit: BoxFit.contain,
      image: NetworkImage('http://assets.stickpng.com/images/580b585b2edbce24c47b2b84.png')
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //   value: _valueCheck,
    //   activeColor: Colors.teal,
    //   onChanged: ( bool? valor ){
    //     setState(() {
    //     _valueCheck = valor!;
    //     });
    //   }
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _valueCheck,
      activeColor: Colors.teal,
      onChanged: ( bool? valor ){
        setState(() {
        _valueCheck = valor!;
        });
      }
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _valueCheck,
      activeColor: Colors.teal,
      onChanged: ( bool? valor ){
        setState(() {
        _valueCheck = valor!;
        });
      }
    );
  }

  
}