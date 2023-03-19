import 'dart:io' ;
import 'package:conduit_core/conduit_core.dart' ;
import 'package:conduit_postgresql/conduit_postgresql.dart';

import '../models/response_model.dart';

class AppAuthController extends ResourceController {
  final ManagedContext managedContext;

  AppAuthController(this.managedContext);

  @Operation.post()
  Future<Response> signIn() async {
    return Response.ok(
      AppResponseModel(data: {
        "id":"1",
        "refreshToken": "refreshToken",
        "accessToken": "accessToken"
      }, message: "signIn ok"
        ).toJson(),
    );
  }

  @Operation.put()
  Future<Response> signUp() async {
    return Response.ok(
      AppResponseModel(data: {
        "id":"1",
        "refreshToken": "refreshToken",
        "accessToken": "accessToken"
      }, message: "signUp ok"
        ).toJson(),
    );
  }

  @Operation.post("refresh")
  Future<Response> refreshToken() async {
    return Response.unauthorized(body: AppResponseModel(
      error: "token is not valid"
        ).toJson());
  }

}