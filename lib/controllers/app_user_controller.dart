import 'dart:io' ;
import 'package:conduit_core/conduit_core.dart' ;

import 'package:dart_auth/utils/app_const.dart';
import 'package:dart_auth/utils/app_utils.dart';
import 'package:dart_auth/utils/app_response.dart';

import '../models/user.dart';


class AppUserController extends ResourceController {
  final ManagedContext managedContext;

  AppUserController(this.managedContext);

  @Operation.get()
  Future<Response> getProfile(
      @Bind.header(HttpHeaders.authorizationHeader) String header) async {
    try {
      final id = AppUtils.getIdFromHeader(header);
      final user = await managedContext.fetchObjectWithID<User>(id);
      user?.removePropertiesFromBackingMap(
          [AppConst.accessToken, AppConst.refreshToken]);
      return AppResponse.ok(
          message: "Успешное получение профиля", body: user?.backing.contents);
    } catch (error) {
      return AppResponse.serverError(error,
          message: "Ошибка получения профиля");
    }
  }

  @Operation.post()
  Future<Response> updateProfile() async {
      try {
        return AppResponse.ok(message: "updateProfile");
      } catch (error) {
        return AppResponse.serverError(error);
      }
    }

  @Operation.put()
  Future<Response> updatePassword() async {
      try {
        return AppResponse.ok(message: "updatePassword");
      } catch (error) {
        return AppResponse.serverError(error);
      }
    }
}