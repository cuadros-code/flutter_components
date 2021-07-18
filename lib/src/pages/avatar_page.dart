import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://assets-es.imgfoot.com/media/cache/1200x1200/cristiano-ronaldo-2021-x.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('SL'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 300),
          image: NetworkImage('https://assets-es.imgfoot.com/media/cache/1200x1200/cristiano-ronaldo-2021-x.jpg')
        ),
      ),
    );
  }
}