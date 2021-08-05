import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/util/BotaoPadrao.dart';
import 'package:mindfelling/util/TextFieldPadrao.dart';
import 'package:mindfelling/util/UtilDialog.dart';

class TelaEditarUsuario extends StatefulWidget {
  TelaEditarUsuario({Key key}) : super(key: key);

  @override
  _TelaEditarUsuarioState createState() => _TelaEditarUsuarioState();
}

class _TelaEditarUsuarioState extends State<TelaEditarUsuario> {
  ControladorUsuario _controladorUsuario = GetIt.I.get<ControladorUsuario>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar meu usuário"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
                    Text("Insira os novos dados"),
                    Divider(),
                    TextFieldPadrao(
                      titulo: "Nome",
                      onChanged: (text) {
                        _controladorUsuario.mUsuarioLogado.nome = text;
                      },
                    ),
                    TextFieldPadrao(
                      titulo: "Nova Senha",
                      obscureText: true,
                      onChanged: (text) {
                        _controladorUsuario.mUsuarioLogado.senha = text;
                      },
                    ),
                    Container(),
                    BotaoPadrao(
                      value: "Salvar alterações",
                      onTap: () {
                        _controladorUsuario.editarUsuario(
                            _controladorUsuario.mUsuarioLogado, sucesso: () {
                          UtilDialog.exibirInformacao(context,
                              emocao: "Dados alterados com sucesso!");
                          Navigator.pushReplacementNamed(
                              context, "/telaPrincipal");
                        });
                      },
                    ),
                    BotaoPadrao(
                        value: "Cancelar",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/telaPrincipal");
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
