import 'package:flutter/material.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:components/src/providers/menu_provider.dart';

class HomePage  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes'),
        backgroundColor: Colors.teal,
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // Widget Cargado En Base A Un Future
    // espera a mostrarse cuando se resuelva
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listItems(snapshot.data!, context),
        ); 
      },
    );
  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context ) {
    
    // Itero Los Datos Del JSON
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.teal),
        onTap: (){
          // Navegando Por Rutas Con Nombre
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());

    }); 

    return opciones;
  }

}

// Ir a ruta sin nombre

/*  final route = MaterialPageRoute(
      builder: ( context ) => AlertPage()
    );
    Navigator.push(context, route); 
*/

/*
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Componentes Temporales'),
        ),
        body: ListView(
          // children: _crearItems(),
          children: _crearItemsCorto(),
        ),
      )
    );
  }


  List<Widget> _crearItems () {

    List<Widget> list = [];

    for (var item in opciones) {
      final tempWidget = ListTile(
       title: Text(item),
      );

      list..add(tempWidget)
          ..add(Divider());

    }
    return list;
  }

  List<Widget> _crearItemsCorto(){

    var widgets = opciones.map((opt){
      return Column(
        children: [
          ListTile(
            title: Text(opt),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.account_box_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
            onLongPress: (){},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }

}
*/