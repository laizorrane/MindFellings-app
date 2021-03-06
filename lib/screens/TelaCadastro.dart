import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/model/Usuario.dart';
import 'package:mindfelling/util/BotaoPadrao.dart';
import 'package:mindfelling/util/TextFieldPadrao.dart';
import 'package:mindfelling/util/UtilDialog.dart';

class TelaDeCadastro extends StatefulWidget {
  TelaDeCadastro({Key key}) : super(key: key);

  @override
  _TelaDeCadastroState createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
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
                 Colors.blue[300],
                    Colors.green[200],
              ],
            ),
          ),
        ),
        title: Text("Me cadastrar", style: TextStyle(fontSize: 24, color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
padding: EdgeInsets.all(0),
          child: Container(
              height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Colors.blue[300],
                    Colors.green[200],
                ],
              )),        
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                child: Column(
          children: [
            Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Text("Fa??a j?? o seu cadastro", style: TextStyle(fontSize: 16, color: Colors.blue)),
                      Divider(),
                      TextFieldPadrao(
                        titulo: "E-mail",
                        onChanged: (text) {
                          _usuario.email = text;
                        },
                      ),
                      TextFieldPadrao(
                        titulo: "Nome",
                        onChanged: (text) {
                          _usuario.nome = text;
                        },
                      ),
                      TextFieldPadrao(
                        inputType: TextInputType.number,
                        titulo: "Idade",
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (text) {
                          _usuario.idade = text;
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
                        value: "Me registrar",
                        onTap: () {
                          _controladorUsuario.cadastrarUsuario(
                            _usuario,
                            sucesso: () {
                              Navigator.pushReplacementNamed(
                                  context, "/telaPrincipal");
                            },
                            erro: (mensagem) {
                              UtilDialog.exibirInformacao(context,
                                  emocao: "Ops!", mensagem: mensagem);
                            },
                          );
                        },
                      ),
                      Row(children: [
                        Expanded(child: Divider()),
                        Text("Ou", style: TextStyle(fontSize: 16, color: Colors.blue)),
                        Expanded(child: Divider())
                      ]),
                      BotaoPadrao(
                        background: Colors.white,
                        value: "Fazer Login",
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/telaLogin");
                        },
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
              ),
      ),
    ));
  }
}
