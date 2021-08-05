import 'package:json_annotation/json_annotation.dart';
part 'Usuario.g.dart';

@JsonSerializable()
class Usuario {
  String nome, email, senha, id, idade;

  Usuario({this.nome, this.email, this.senha, this.id, this.idade});

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
