import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/model/MenuItem.dart';
import 'package:mindfelling/util/RegistroDiarioWidget.dart';

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();

  BuildContext mMainContext;

  @override
  void initState() {
    mMainContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.red[300],
                  Colors.yellow,
                ],
              ),
            ),
          ),
          title: Text("Registro"),
        ),
        drawer: new Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.red[400],
                ],
              ),
            ),
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.red[400],
                      ],
                    ),
                  ),
                  accountName: new Text(
                      "${_controladorUsuario.mUsuarioLogado.nome}, ${_controladorUsuario.mUsuarioLogado.idade}",
                      style: TextStyle(fontSize: 20)),
                  accountEmail: new Text(
                      "${_controladorUsuario.mUsuarioLogado.email}",
                      style: TextStyle(fontSize: 16)),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage:
                        new NetworkImage('http://i.pravatar.cc/300'),
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    MenuItem(
                      icon: Icons.calendar_today,
                      title: "Meus Registros",
                      clique: () {
                        Navigator.pushReplacementNamed(
                            context, "/telaRegistros");
                      },
                    ),
                    MenuItem(
                        icon: Icons.settings,
                        title: "Editar usuário",
                        value: "Home",
                        clique: () {
                          Navigator.pushReplacementNamed(
                              context, "/telaEditarUsuario");
                        }),
                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Sair",
                      value: "Sair",
                      clique: () {
                        _controladorUsuario.deslogarUsuario(
                          sucesso: () {
                            Navigator.pushReplacementNamed(
                                context, "/telaLogin");
                          },
                        );
                      },
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              Card(
                  margin: EdgeInsets.all(8),
                  child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                        child: Wrap(spacing: 32, runSpacing: 32, children: [
                          Text(
                            "Como você está?",
                            style: TextStyle(fontSize: 32, color: Colors.black),
                          )
                        ]),
                      ))),
              RegistroDiarioWidget()
            ])));
  }
}
