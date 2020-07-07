import 'package:flutter/material.dart';
import 'package:oms_app/src/pages/tabs_page.dart';
import 'package:oms_app/src/services/datos_service.dart';
import 'package:oms_app/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new DatosPaisService())
      ],
      child: MaterialApp(
        title: 'OMS APP',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}