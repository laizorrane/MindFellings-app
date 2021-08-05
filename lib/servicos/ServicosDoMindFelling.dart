import 'package:mindfelling/model/Registro.dart';
import 'package:mindfelling/model/Usuario.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mindfelling/util/UtilRetorno.dart';
import 'package:dio/dio.dart';

part 'ServicosDoMindFelling.g.dart';

@RestApi(baseUrl: "https://us-central1-meu-blog-curso.cloudfunctions.net")
abstract class ServicosDoMindFelling {
  factory ServicosDoMindFelling(Dio dio, {String baseUrl}) =
    _ServicosDoMindFelling;

  @POST("/usuarioMindLaiz/usuario")
  Future<UtilRetornoUsuario> cadastrarUsuario(@Body() Usuario usuario);

  @PUT("/usuarioMindLaiz/usuario")
  Future<UtilRetornoUsuario> editarUsuario(@Body() Usuario usuario);

  @GET("/usuarioMindLaiz/usuario")
  Future<UtilRetornoUsuario> logarUsuario(
      @Query("email") String email, @Query("senha") String senha);

  @GET("/registroEmocionalLaiz/registroEmocoes")
  Future<UtilRetornoRegistros> consultarRegistros();

  @DELETE("/registroEmocionalLaiz/registroEmocoes")
  Future<String> excluirRegistro(@Query("id") String idRegistro);

  @POST("/registroEmocionalLaiz/registroEmocoes")
  Future<UtilRetornoRegistro> manterRegistro(@Body() Registro registro);
}
