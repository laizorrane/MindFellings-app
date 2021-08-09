import 'package:get_it/get_it.dart';
import 'package:mindfelling/model/Registro.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/servicos/ServicosDoMindFelling.dart';
import 'package:mobx/mobx.dart';
import 'package:mindfelling/util/StatusConsulta.dart';

part 'ControladorRegistro.g.dart';

class ControladorRegistro = _ControladorRegistro with _$ControladorRegistro;

abstract class _ControladorRegistro with Store {
  ServicosDoMindFelling mService = GetIt.I.get<ServicosDoMindFelling>();

  @observable
  ObservableList<Registro> mRegistros = ObservableList<Registro>();

  @observable
  StatusConsulta mStatusConsultaRegistros = StatusConsulta.CARREGANDO;

  @observable
  String conteudoRegistro = "";
  @observable
  String emocaoRegistro = "";

  @computed
  bool get habilitadoARegistrar => emocaoRegistro.isNotEmpty;

  void consultarORegistro(
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mStatusConsultaRegistros = StatusConsulta.CARREGANDO;
    mService
        .consultarRegistros(GetIt.I.get<ControladorUsuario>().mUsuarioLogado.id)
        .then((responseTodosRegistros) {
      mRegistros.clear();
      mRegistros.addAll(responseTodosRegistros.sucesso);
      mStatusConsultaRegistros = StatusConsulta.SUCESSO;
      sucesso?.call();
    }).catchError((onError) {
      mStatusConsultaRegistros = StatusConsulta.FALHA;
      erro?.call(onError.response.data["falha"]);
    });
  }

  void publicarEmocao(Registro registro,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    if (registro == null) {
      registro = Registro(
          conteudo: conteudoRegistro,
      dataDeRegistro : DateTime.now(),
          emocao: emocaoRegistro,
          criador: GetIt.I.get<ControladorUsuario>().mUsuarioLogado);
    } else {
      registro.dataDeRegistro = DateTime.now();
      registro.conteudo = conteudoRegistro;
      registro.emocao = emocaoRegistro;
    }
    carregando?.call();
    mService.manterRegistro(registro).then((value) {
      if (registro.id == null || registro.emocao == null)
        mRegistros.insert(0, value.sucesso);
      else {
        var index = mRegistros.indexWhere((reg) => reg.id == registro.id);
        mRegistros.removeAt(index);
        mRegistros.insert(index, value.sucesso);
      }
      emocaoRegistro = "";
      conteudoRegistro = "";
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
    });
  }

  void excluirRegistro(Registro registro,
      {Function() sucesso,
      Function() carregando,
      Function(String mensagem) erro}) {
    carregando?.call();
    mService.excluirRegistro(registro.id).then((value) {
      mRegistros.removeWhere((post) => post.id == registro.id);
      sucesso?.call();
    }).catchError((onError) {
      erro?.call(onError.response.data["falha"]);
      mStatusConsultaRegistros = StatusConsulta.FALHA;
    });
  }
}
