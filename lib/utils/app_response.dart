import 'dart:io' ;
import 'package:conduit_core/conduit_core.dart' ;
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../models/response_model.dart';

class AppResponse extends Response {
  AppResponse.serverError(dynamic error, {String? message}) 
  : super.serverError(body: _getResponseModel(error, message));
  
  static _getResponseModel(error, String? message) {
    if (error is QueryException) {
      return AppResponseModel(
        error: error.toString(), message: message ?? error.message);
    }

    if (error is JwtException) {
      return AppResponseModel(
        error: error.toString(), message: message ?? error.message);
    }

    if (error is AuthorizationParserException) {
      return AppResponseModel(
        error: error.toString(), message: message ?? "Ошибка!");
    }

    return AppResponseModel(
      error: error.toString(), message: message ?? "Неизвестная ошибка");
  }

  AppResponse.ok({dynamic body, String? message}) 
  : super.ok(AppResponseModel(data: body, message: message));

}