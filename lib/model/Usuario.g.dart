// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    nome: json['nome'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
    id: json['id'] as String,
    idade: json['idade'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
      'id': instance.id,
      'idade': instance.idade,
    };
