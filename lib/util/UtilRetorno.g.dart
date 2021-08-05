// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UtilRetorno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UtilRetornoUsuario _$UtilRetornoUsuarioFromJson(Map<String, dynamic> json) {
  return UtilRetornoUsuario(
    sucesso: json['sucesso'] == null
        ? null
        : Usuario.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoUsuarioToJson(UtilRetornoUsuario instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoRegistros _$UtilRetornoRegistrosFromJson(Map<String, dynamic> json) {
  return UtilRetornoRegistros(
    sucesso: (json['sucesso'] as List)
        ?.map((e) =>
            e == null ? null : Registro.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilRetornoRegistrosToJson(
        UtilRetornoRegistros instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoRegistro _$UtilRetornoRegistroFromJson(Map<String, dynamic> json) {
  return UtilRetornoRegistro(
    sucesso: json['sucesso'] == null
        ? null
        : Registro.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoRegistroToJson(
        UtilRetornoRegistro instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };
