import 'dart:io' ;
import 'package:conduit_core/conduit_core.dart' ;
import 'package:conduit_postgresql/conduit_postgresql.dart';
import 'package:dart_auth/utils/app_utils.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:conduit/conduit.dart';

import '../models/response_model.dart';
import '../models/user.dart';
import '../utils/app_response.dart';

class AppUserController extends ResourceController {
  final ManagedContext managedContext;

  AppUserController(this.managedContext);

  @Operation.get()
  Future<Response> getProfile() async {
      try {
        return AppResponse.ok(message: "getProfile");
      } catch (error) {
        return AppResponse.serverError(error);
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