import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/servicos/ServicosDoMindFelling.dart';
import 'package:mindfelling/screens/TelaCadastro.dart';
import 'package:mindfelling/screens/TelaEditarUsuario.dart';
import 'package:mindfelling/screens/TelaLogin.dart';
import 'package:mindfelling/screens/TelaPrincipal.dart';
import 'package:mindfelling/screens/TelaRegistros.dart';
import 'package:mindfelling/screens/TelaSplash.dart';
import 'package:mindfelling/controladores/ControladorRegistro.dart';

import 'Controladores/ControladorUsuario.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(ServicosDoMindFelling(Dio()));
  getIt.registerLazySingleton(() => ControladorUsuario());
  getIt.registerSingleton(ControladorRegistro());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Fellings APP',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => TelaSplash(),
        "/telaLogin": (_) => TelaLogin(),
        "/telaPrincipal": (_) => TelaPrincipal(),
        "/telaDeCadastro": (_) => TelaDeCadastro(),
        "/telaEditarUsuario": (_) => TelaEditarUsuario(),
        "/telaRegistros": (_) => TelaRegistros(),
      },
    );
    
  }
}
