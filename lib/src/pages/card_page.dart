import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardTipo_1(),
          SizedBox(height: 20.0,),
          _cardTipo_2(),
          SizedBox(height: 20.0,),
          _cardTipo_3(),
        ],
      )
    );
  }

  Widget _cardTipo_1() {

    return Card(
      elevation: 8.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('Tarjeta'),
            subtitle: Text('Subtitulo de la tarjeta'),
            leading: Icon( Icons.photo_album, color: Colors.teal, ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){},
                child: Text('Cancelar')
              ),
              TextButton(
                onPressed: (){}, 
                child: Text('Ok')
              )
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo_2() {

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 8.0,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'), 
            image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/246/312/original/mountain-lake-sunset-landscape-first-person-view-vector.jpg'),
            fadeInDuration: Duration( milliseconds: 300 ),
            height: 390.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Tarjeta con imagen'),
          )
        ],
      ),
    );

  }

  Widget _cardTipo_3() {

    return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: Color.fromRGBO(21, 41, 74, 1),
        child: Center(
          heightFactor: 1.3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  'Total View',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                '55,000',
                style: TextStyle(
                  color: Colors.yellow.shade600,
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                )),
              Text(
                'website: www.flutter.io',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: OutlinedButton(
                  onPressed: (){},
                  child: Text('+ 300 Post'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide( color: Colors.white, width: 1 ),
                    textStyle: TextStyle(fontSize: 15),
                    shadowColor: Colors.red
                  )
                )
              ),
            ],
          ),
        ),
      );

  }


}