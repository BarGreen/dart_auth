import 'dart:async';
import 'dart:io';

import 'package:conduit/conduit.dart';
import 'package:conduit_core/conduit_core.dart' ;

import 'package:dart_auth/utils/app_const.dart';
import 'package:dart_auth/utils/app_response.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class AppTokenController extends Controller {
  @override
  FutureOr<RequestOrResponse?> handle(Request request) {
    try {
      final header = request.raw.headers.value(HttpHeaders.authorizationHeader);
      final token = AuthorizationBearerParser().parse(header);
      final jwtClaim = verifyJwtHS256Signature(
        token ?? "", AppConst.secretKey);
      jwtClaim.validate();
      return request;
    } catch (error) {
      return AppResponse.serverError(error);
    }
  }
}