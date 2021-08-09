import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/model/MenuItem.dart';
import 'package:mindfelling/util/RegistroDiarioWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        appBar:
          AppBar(iconTheme: IconThemeData(color: Colors.white),

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[300],
                    Colors.green[200],
                ],
              ),
            ),
          ),
          title: Text(
            "Registro",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        drawer: new Drawer(
        
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Colors.blue[300],
                    Colors.green[200],
                ],
              ),
            ),
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[300],
                    Colors.green[200],
                      ],
                    ),
                  ),
                  accountName: new Text(
                      "${_controladorUsuario.mUsuarioLogado.nome}, ${_controladorUsuario.mUsuarioLogado.idade}",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  accountEmail: new Text(
                      "${_controladorUsuario.mUsuarioLogado.email}",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage:
                        new NetworkImage('http://i.pravatar.cc/300'),
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    MenuItem(
                      icon: FontAwesomeIcons.calendarAlt,
                      title: "Meus Registros",
                      clique: () {
                        Navigator.pushReplacementNamed(
                            context, "/telaRegistros");
                      },
                    ),
                    MenuItem(
                        icon: FontAwesomeIcons.userEdit,
                        title: "Editar usuário",
                        value: "Home",
                        clique: () {
                          Navigator.pushReplacementNamed(
                              context, "/telaEditarUsuario");
                        }),
                    MenuItem(
                      icon: FontAwesomeIcons.signOutAlt,
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
            padding: EdgeInsets.zero,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                   Colors.blue[300],
                    Colors.green[200],
                ],
              )),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 96, left: 16, right: 16),
                  child: RegistroDiarioWidget(),
                )
              ]),
            )));
  }
}
