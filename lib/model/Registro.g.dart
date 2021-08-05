// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Registro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registro _$RegistroFromJson(Map<String, dynamic> json) {
  return Registro(
    conteudo: json['conteudo'] as String,
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
    dataDeRegistro:
        UtilDataHora.convertStringToDate(json['dataDeRegistro'] as String),
    id: json['id'] as String,
    emocao: json['emocao'] as String,
  );
}

Map<String, dynamic> _$RegistroToJson(Registro instance) => <String, dynamic>{
      'id': instance.id,
      'conteudo': instance.conteudo,
      'emocao': instance.emocao,
      'dataDeRegistro': instance.dataDeRegistro?.toIso8601String(),
      'criador': instance.criador,
    };
