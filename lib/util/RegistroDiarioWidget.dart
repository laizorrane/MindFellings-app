import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/controladores/ControladorRegistro.dart';
import 'package:mindfelling/model/Registro.dart';
import 'package:mindfelling/util/BotaoPadrao.dart';
import 'package:mindfelling/util/TextFieldPadraoExp.dart';
import 'package:mindfelling/util/UtilDialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistroDiarioWidget extends StatefulWidget {
  final Registro registroEditar;
  final Function() sucesso;
  const RegistroDiarioWidget({Key key, this.registroEditar, this.sucesso})
      : super(key: key);

  @override
  _RegistroDiarioWidgetState createState() => _RegistroDiarioWidgetState();
}

class _RegistroDiarioWidgetState extends State<RegistroDiarioWidget> {
  ControladorRegistro _controladorRegistro = GetIt.I.get<ControladorRegistro>();
  bool iconeRadiante = false;
  bool iconeFeliz = false;
  bool iconeIndiferente = false;
  bool iconeRaiva = false;
  bool iconeTriste = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[

                 Text(
                              "Como você está?",
                              style: TextStyle(fontSize: 32, color: Colors.black),
                            ),
                            SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                    
                      IconButton(
                          color: iconeRadiante ? Colors.green : Colors.grey,
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.laughBeam),
                          onPressed: () {
                            setState(() {
                              iconeRadiante = true;
                              iconeFeliz = false;
                              iconeIndiferente = false;
                              iconeRaiva = false;
                              iconeTriste = false;
                              _controladorRegistro.emocaoRegistro = "RADIANTE";
                            });
                          }),
                      Text("Radiante",
                          style: TextStyle(
                              color: iconeRadiante ? Colors.green : Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          color: iconeFeliz ? Colors.blue : Colors.grey,
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.smile),
                          onPressed: () {
                            setState(() {
                              iconeRadiante = false;
                              iconeFeliz = true;
                              iconeIndiferente = false;
                              iconeRaiva = false;
                              iconeTriste = false;
                              _controladorRegistro.emocaoRegistro = "FELIZ";
                            });
                          }),
                      Text("Feliz",
                          style: TextStyle(
                              color: iconeFeliz ? Colors.blue : Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          color:
                              iconeIndiferente ? Colors.yellow[900] : Colors.grey,
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.mehRollingEyes),
                          onPressed: () {
                            setState(() {
                              iconeRadiante = false;
                              iconeFeliz = false;
                              iconeIndiferente = true;
                              iconeRaiva = false;
                              iconeTriste = false;
                              _controladorRegistro.emocaoRegistro = "INDIFERENTE";
                            });
                          }),
                      Text("Indiferente",
                          style: TextStyle(
                              color: iconeIndiferente
                                  ? Colors.yellow[900]
                                  : Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          color: iconeRaiva ? Colors.red : Colors.grey,
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.angry),
                          onPressed: () {
                            setState(() {
                              iconeRadiante = false;
                              iconeFeliz = false;
                              iconeIndiferente = false;
                              iconeRaiva = true;
                              iconeTriste = false;
                              _controladorRegistro.emocaoRegistro = "RAIVA";
                            });
                          }),
                      Text("Raiva",
                          style: TextStyle(
                              color: iconeRaiva ? Colors.red : Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          color: iconeTriste ? Colors.purple : Colors.grey,
                          iconSize: 50,
                          icon: FaIcon(FontAwesomeIcons.sadCry),
                          onPressed: () {
                            setState(() {
                              iconeRadiante = false;
                              iconeFeliz = false;
                              iconeIndiferente = false;
                              iconeRaiva = false;
                              iconeTriste = true;
                              _controladorRegistro.emocaoRegistro = "TRISTE";
                            });
                          }),
                      Text("Triste",
                          style: TextStyle(
                              color: iconeTriste ? Colors.purple : Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              Container(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldPadraoExp(
                  titulo: widget.registroEditar != null
                      ? "Editar Registro"
                      : "Descreva seu dia:",
                  value: widget.registroEditar?.conteudo ??
                      _controladorRegistro.conteudoRegistro,
                  onChanged: (text) {
                    _controladorRegistro.conteudoRegistro = text;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Observer(builder: (_) {
                    return Container(
                      width: 100,
                      height: 30,
                      child: BotaoPadrao(
                        background: Colors.deepOrange[300],
                        value: widget.registroEditar != null
                            ? "Editar"
                            : "Registrar",
                        onTap: _controladorRegistro.habilitadoARegistrar
                            ? () {
                                _controladorRegistro.publicarEmocao(
                                  widget.registroEditar,
                                  sucesso: () {
                                    Navigator.pop(context);
                                    setState(() {});
                                    widget.sucesso();
                                  },
                                  erro: (mensagem) {
                                    Navigator.pop(context);
                                    UtilDialog.exibirInformacao(context,
                                        emocao: "Ops!", mensagem: mensagem);
                                  },
                                  carregando: () {
                                    UtilDialog.showLoading(context);
                                  },
                                );
                              }
                            : null,
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
