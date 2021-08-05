// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServicosDoMindFelling.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ServicosDoMindFelling implements ServicosDoMindFelling {
  _ServicosDoMindFelling(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://us-central1-meu-blog-curso.cloudfunctions.net';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UtilRetornoUsuario> cadastrarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuarioMindLaiz/usuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsuario> editarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuarioMindLaiz/usuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsuario> logarUsuario(email, senha) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(senha, 'senha');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'email': email, r'senha': senha};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuarioMindLaiz/usuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoRegistros> consultarRegistros() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/registroEmocionalLaiz/registroEmocoes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoRegistros.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> excluirRegistro(idRegistro) async {
    ArgumentError.checkNotNull(idRegistro, 'idRegistro');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': idRegistro};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>(
        '/registroEmocionalLaiz/registroEmocoes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<UtilRetornoRegistro> manterRegistro(registro) async {
    ArgumentError.checkNotNull(registro, 'registro');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registro?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/registroEmocionalLaiz/registroEmocoes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoRegistro.fromJson(_result.data);
    return value;
  }
}
