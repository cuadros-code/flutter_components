import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
 
void main(){ 
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.red
  //   )
  // );
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',

      // Agregar idioma español
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), 
        const Locale('es', 'ES'),
      ],
      // Rutas displonibles 
      routes: getAppRoutes(),

      // Redirige Ruta No Encontrada 
      onGenerateRoute: ( RouteSettings settings ){
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );
      },
    );
  }
}