import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:components/src/pages/login_page.dart';
import 'package:components/src/pages/listview_page.dart';
import 'package:components/src/pages/animated_container.dart';

// Rutas de mi App
Map<String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
    'home'   : ( BuildContext context ) => HomePage(),
    'alert'  : ( BuildContext context ) => AlertPage(),
    'avatar' : ( BuildContext context ) => Avatar(),
    'card'   : ( BuildContext context ) => CardPage(),
    'inputs' : ( BuildContext context ) => InputPage(),
    'slider' : ( BuildContext context ) => SliderPage(),
    'login'  : ( BuildContext context ) => LoginPage(),
    'list'   : ( BuildContext context ) => ListPage(),
    'animatedContainer': ( BuildContext context ) => AnimatedContainerPage(),
  };
}