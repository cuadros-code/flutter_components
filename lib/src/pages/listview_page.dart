import 'package:flutter/material.dart';
import 'dart:async';


class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  bool _isLoading = false;

  // Antes de renderizar los componentes
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        // _agregar10();
        fetchData();
      }
    });
  }

  // Al cerrar pagina
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('ListView Builder'),
         backgroundColor: Colors.teal,
       ),
       body: Stack(
         children: [
          _creatLista(),
          _crearLoading(),
         ],
       )
    );
  }

  Widget _creatLista( ) {
    return RefreshIndicator(
        onRefresh: () => getPage1(),
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ( BuildContext context, int index ){
    
          final imagen = _listaNumeros[index];
    
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?random=$imagen')
          );
        },
      ),
    );
  }

  Future<Null> getPage1() async{
    final duration = Duration(seconds: 2);
    Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  Widget _crearLoading() {
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( color: Colors.red, ),
            ],
          ),
          SizedBox(height: 30)
        ],
      );
      
    }else{
      return Container();
    }
  }


  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }
    setState(() {});
  }

  Future fetchData() async {
    
    _isLoading = true;
    setState(() {});

    final duration = Duration( seconds: 2);

    Timer( duration, (){
      _isLoading = false;
      _agregar10();
      _scrollController.animateTo(
        _scrollController.position.pixels + 100, 
        duration: Duration( milliseconds: 300 ), 
        curve: Curves.slowMiddle);
    });

  }
  

}