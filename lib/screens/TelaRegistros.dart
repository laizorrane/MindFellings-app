import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mindfelling/controladores/ControladorRegistro.dart';
import 'package:mindfelling/util/StatusConsulta.dart';
import 'package:mindfelling/util/UtilDataHora.dart';
import 'package:mindfelling/util/UtilDialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TelaRegistros extends StatefulWidget {
  TelaRegistros({Key key}) : super(key: key);

  @override
  _TelaRegistrosState createState() => _TelaRegistrosState();
}

class _TelaRegistrosState extends State<TelaRegistros>
    with AfterLayoutMixin<TelaRegistros> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ControladorRegistro _controladorRegistro = GetIt.I.get<ControladorRegistro>();
  BuildContext mMainContext;

  @override
  void initState() {
    mMainContext = context;
    super.initState();
  }

  FaIcon getIcone(String emocao) {
    switch (emocao) {
      case "RADIANTE":
        return FaIcon(FontAwesomeIcons.laughBeam,
            size: 34, color: Colors.green);
      case "FELIZ":
        return FaIcon(FontAwesomeIcons.smile, size: 34, color: Colors.blue);
      case "INDIFERENTE":
        return FaIcon(FontAwesomeIcons.meh,
            size: 34, color: Colors.yellow[900]);
      case "RAIVA":
        return FaIcon(FontAwesomeIcons.angry, size: 34, color: Colors.red);
      case "TRISTE":
        return FaIcon(FontAwesomeIcons.sadCry, size: 34, color: Colors.purple);
      default:
        return FaIcon(FontAwesomeIcons.mehRollingEyes,
            size: 34, color: Colors.grey);
    }
  }

  _consultarRegistro() {
    _controladorRegistro.consultarORegistro(sucesso: () {
      Navigator.pop(context);
      _refreshController.refreshCompleted();
    }, erro: (mensagem) {
      Navigator.pop(context);
      _refreshController.refreshFailed();
    }, carregando: () {
      UtilDialog.showLoading(context);
    });
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
            title: Text(
              "Meu Diário",
              style: TextStyle(fontSize: 24),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/telaPrincipal");
              },
            )),
        body: SmartRefresher(
            controller: _refreshController,
            header: WaterDropHeader(),
            onRefresh: _consultarRegistro,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              primary: true,
                padding: EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.red[300],
                        Colors.yellow,
                      ],
                    ),
                  ),
                  child: Column(children: [
                    Observer(builder: (_) {
                      switch (_controladorRegistro.mStatusConsultaRegistros) {
                        case StatusConsulta.CARREGANDO:
                          return Text("CARREGANDO...");
                          break;
                        case StatusConsulta.SUCESSO:
                          return SingleChildScrollView(
                            child: Container(
                                                              padding: const EdgeInsets.only( top: 16),

                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple,
                                    Colors.red[300],
                                    Colors.yellow,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: ListView.builder(
                                  
                                  primary: false,
                                  itemBuilder: (context, index) {
                                    var reg =
                                        _controladorRegistro.mRegistros[index];
                                    return Card(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              getIcone(reg.emocao),
                                              Visibility(
                                                visible: reg.isCriador,
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .edit,
                                                            color: Colors
                                                                .indigo[900]),
                                                        onPressed: () {
                                                          UtilDialog.editarReg(
                                                              mMainContext,
                                                              reg);
                                                        }),
                                                    IconButton(
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .trashAlt,
                                                          color: Colors
                                                              .indigo[900],
                                                        ),
                                                        onPressed: () {
                                                          UtilDialog.excluirReg(
                                                              mMainContext,
                                                              reg);
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              children: [
                                                Container(),
                                                Text(UtilDataHora
                                                    .convertDateTime(
                                                        reg.dataDeRegistro))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                                  },
                                  itemCount:
                                      _controladorRegistro.mRegistros.length,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          );
                          break;
                        case StatusConsulta.FALHA:
                          return Text("Ops! Não consegui carregar");
                          break;
                        default:
                          return Container();
                      }
                    })
                  ]),
                ))));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _consultarRegistro();
  }
}
