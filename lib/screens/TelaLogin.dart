import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/model/Usuario.dart';
import 'package:mindfelling/util/BotaoPadrao.dart';
import 'package:mindfelling/util/TextFieldPadrao.dart';
import 'package:mindfelling/util/UtilDialog.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({Key key}) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  Usuario _usuario = Usuario();
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
          title: Text("Mind Fellings", style: TextStyle(fontSize: 24),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(children: [
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    Text("Faça seu login:"),
                    Divider(),
                    TextFieldPadrao(
                      titulo: "E-mail",
                      onChanged: (text) {
                        _usuario.email = text;
                      },
                    ),
                    TextFieldPadrao(
                      titulo: "Senha",
                      obscureText: true,
                      onChanged: (text) {
                        _usuario.senha = text;
                      },
                    ),
                    Container(),
                    BotaoPadrao(
                      background: Colors.white,
                      value: "Entrar",
                      onTap: () {
                        _controladorUsuario.logarUsuario(_usuario, sucesso: () {
                          Navigator.pushReplacementNamed(
                              context, "/telaPrincipal");
                        }, erro: (mensagem) {
                          UtilDialog.exibirInformacao(context,
                              emocao: "Ops!", mensagem: mensagem);
                        });
                      },
                    ),
                    Row(children: [
                      Expanded(child: Divider()),
                      Text("Ou"),
                      Expanded(child: Divider())
                    ]),
                    BotaoPadrao(
                      background: Colors.white,
                      value: "Me Cadastrar",
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, "/telaDeCadastro");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
