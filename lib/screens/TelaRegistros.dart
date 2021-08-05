import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/controladores/ControladorRegistro.dart';
//import 'package:mindfelling/util/RegistroDiarioWidget.dart';
import 'package:mindfelling/util/UtilDataHora.dart';
import 'package:mindfelling/util/UtilDialog.dart';
//mport 'package:pull_to_refresh/pull_to_refresh.dart';

class TelaRegistros extends StatefulWidget {
  TelaRegistros({Key key}) : super(key: key);

  @override
  _TelaRegistrosState createState() => _TelaRegistrosState();
}

class _TelaRegistrosState extends State<TelaRegistros> {
  ControladorRegistro _controladorRegistro = GetIt.I.get<ControladorRegistro>();
  BuildContext mMainContext;

  @override
  void initState() {
    mMainContext = context;
    super.initState();
  }

  Icon getIcone(String emocao) {
    switch (emocao) {
      case "RADIANTE":
        return Icon(Icons.sentiment_very_satisfied_outlined,
            size: 34, color: Colors.green);
      case "FELIZ":
        return Icon(Icons.sentiment_satisfied_alt_outlined,
            size: 34, color: Colors.blue);
      case "INDIFERENTE":
        return Icon(Icons.sentiment_neutral_outlined,
            size: 34, color: Colors.yellow[900]);
      case "RAIVA":
        return Icon(Icons.sentiment_very_dissatisfied_outlined,
            size: 34, color: Colors.red);
      case "TRISTE":
        return Icon(Icons.sentiment_dissatisfied_outlined,
            size: 34, color: Colors.purple);
      default:
        return Icon(Icons.sentiment_neutral_outlined,
            size: 34, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Meu Diário"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/telaPrincipal");
              },
            )),
        body: ListView.builder(
          primary: false,
          itemBuilder: (context, index) {
            var reg = _controladorRegistro.mRegistros[index];
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getIcone(reg.emocao),
                      //Text("${reg.emocao}"),
                      Visibility(
                        visible: reg.isCriador,
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  UtilDialog.editarReg(mMainContext, reg);
                                }),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  UtilDialog.excluirReg(mMainContext, reg);
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Text("${reg.conteudo}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Container(),
                        Text(UtilDataHora.convertDateTime(reg.dataDeRegistro))
                      ],
                    ),
                  )
                ],
              ),
            ));
          },
          itemCount: _controladorRegistro.mRegistros.length,
          shrinkWrap: true,
        ));
  }
}
