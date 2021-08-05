// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorRegistro.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorRegistro on _ControladorRegistro, Store {
  Computed<bool> _$habilitadoARegistrarComputed;

  @override
  bool get habilitadoARegistrar => (_$habilitadoARegistrarComputed ??=
          Computed<bool>(() => super.habilitadoARegistrar,
              name: '_ControladorRegistro.habilitadoARegistrar'))
      .value;

  final _$mRegistrosAtom = Atom(name: '_ControladorRegistro.mRegistros');

  @override
  ObservableList<Registro> get mRegistros {
    _$mRegistrosAtom.reportRead();
    return super.mRegistros;
  }

  @override
  set mRegistros(ObservableList<Registro> value) {
    _$mRegistrosAtom.reportWrite(value, super.mRegistros, () {
      super.mRegistros = value;
    });
  }

  final _$mStatusConsultaRegistrosAtom =
      Atom(name: '_ControladorRegistro.mStatusConsultaRegistros');

  @override
  StatusConsulta get mStatusConsultaRegistros {
    _$mStatusConsultaRegistrosAtom.reportRead();
    return super.mStatusConsultaRegistros;
  }

  @override
  set mStatusConsultaRegistros(StatusConsulta value) {
    _$mStatusConsultaRegistrosAtom
        .reportWrite(value, super.mStatusConsultaRegistros, () {
      super.mStatusConsultaRegistros = value;
    });
  }

  final _$conteudoRegistroAtom =
      Atom(name: '_ControladorRegistro.conteudoRegistro');

  @override
  String get conteudoRegistro {
    _$conteudoRegistroAtom.reportRead();
    return super.conteudoRegistro;
  }

  @override
  set conteudoRegistro(String value) {
    _$conteudoRegistroAtom.reportWrite(value, super.conteudoRegistro, () {
      super.conteudoRegistro = value;
    });
  }

  final _$emocaoRegistroAtom =
      Atom(name: '_ControladorRegistro.emocaoRegistro');

  @override
  String get emocaoRegistro {
    _$emocaoRegistroAtom.reportRead();
    return super.emocaoRegistro;
  }

  @override
  set emocaoRegistro(String value) {
    _$emocaoRegistroAtom.reportWrite(value, super.emocaoRegistro, () {
      super.emocaoRegistro = value;
    });
  }

  @override
  String toString() {
    return '''
mRegistros: ${mRegistros},
mStatusConsultaRegistros: ${mStatusConsultaRegistros},
conteudoRegistro: ${conteudoRegistro},
emocaoRegistro: ${emocaoRegistro},
habilitadoARegistrar: ${habilitadoARegistrar}
    ''';
  }
}
