import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/controladores/ControladorRegistro.dart';
import 'package:mindfelling/model/Registro.dart';
import 'package:mindfelling/util/BotaoPadrao.dart';
import 'package:mindfelling/util/RegistroDiarioWidget.dart';

class UtilDialog {
  static ControladorRegistro _controladorRegistro =
      GetIt.I.get<ControladorRegistro>();

  static void exibirInformacao(BuildContext context,
      {String emocao, String mensagem}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$emocao",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text("$mensagem"),
                  SizedBox(
                    height: 16,
                  ),
                  BotaoPadrao(
                    value: "Ok, entendido",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static void excluirReg(BuildContext mainContext, Registro registro) {
    showDialog(
      context: mainContext,
      builder: (context) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Atenção, deseja excluir este sentimento?"),
                  Divider(),
                  Text(
                    "${registro.emocao}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Divider(),
                  Text("${registro.conteudo}"),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 35,
                    child: Row(
                      children: [
                        Expanded(
                          child: BotaoPadrao(
                            value: "Confirmar",
                            onTap: () {
                              _controladorRegistro.excluirRegistro(
                                registro,
                                carregando: () {
                                  Navigator.pop(mainContext);
                                  showLoading(mainContext);
                                },
                                sucesso: () {
                                  Navigator.pop(mainContext);
                                  exibirInformacao(mainContext,
                                      emocao: "Sucesso!",
                                      mensagem: "O registro foi excluido");
                                },
                                erro: (mensagem) {
                                  Navigator.pop(mainContext);
                                  exibirInformacao(mainContext,
                                      emocao: "Ops!", mensagem: mensagem);
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: BotaoPadrao(
                            value: "Cancelar",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void editarReg(BuildContext mainContext, Registro registro) {
    showDialog(
      context: mainContext,
      builder: (context) {
        return Center(
          child: Card(
            margin: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Atenção, você está editando!"),
                  Divider(),
                  RegistroDiarioWidget(
                      registroEditar: registro,
                      sucesso: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
