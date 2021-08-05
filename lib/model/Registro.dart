import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mindfelling/Controladores/ControladorUsuario.dart';
import 'package:mindfelling/model/Usuario.dart';
import 'package:mindfelling/util/UtilDataHora.dart';
part 'Registro.g.dart';

@JsonSerializable()
class Registro {
  String id, conteudo, emocao;
  


  @JsonKey(fromJson: UtilDataHora.convertStringToDate)
  DateTime dataDeRegistro;
  Usuario criador;

  bool get isCriador =>
      GetIt.I.get<ControladorUsuario>().mUsuarioLogado.id.contains(criador.id);

  Registro({this.conteudo, this.criador, this.dataDeRegistro, this.id, this.emocao});
  factory Registro.fromJson(Map<String, dynamic> json) =>
      _$RegistroFromJson(json);
  Map<String, dynamic> toJson() => _$RegistroToJson(this);
}
