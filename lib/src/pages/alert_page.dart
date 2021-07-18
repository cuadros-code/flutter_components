import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            _mostrarAlerta(context);
          }, 
          child: Text('Mostrar Alerta'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: StadiumBorder()
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _mostrarAlerta( BuildContext context ){
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: ( context ){
        return AlertDialog(
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(15)
           ),
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido Alerta'),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Aceptar')
            ),
          ],
        );
      }
    );
  }

}