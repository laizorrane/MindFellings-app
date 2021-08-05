import 'package:json_annotation/json_annotation.dart';
import 'package:mindfelling/model/Registro.dart';
import 'package:mindfelling/model/Usuario.dart';

part 'UtilRetorno.g.dart';

@JsonSerializable()
class UtilRetornoUsuario {
  Usuario sucesso;
  UtilRetornoUsuario({this.sucesso});

  factory UtilRetornoUsuario.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoUsuarioToJson(this);
}

@JsonSerializable()
class UtilRetornoRegistros {
  List<Registro> sucesso;
  UtilRetornoRegistros({this.sucesso});

  factory UtilRetornoRegistros.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoRegistrosFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoRegistrosToJson(this);
}

@JsonSerializable()
class UtilRetornoRegistro {
  Registro sucesso;
  UtilRetornoRegistro({this.sucesso});

  factory UtilRetornoRegistro.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoRegistroFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoRegistroToJson(this);
}

