import 'dart:io';

import 'package:jaguar_jwt/jaguar_jwt.dart';

abstract class AppUtils {
  // пустой конструктор. 
  // таким образом мы не сможем создать экз.данного класса.
  const AppUtils._();

  static int getIdFromToken(String token) {
    try {
      final key = Platform.environment["SECRET_KEY"];
      final JwtClaim = verifyJwtHS256Signature(token, key ?? "SECRET_KEY");
      return int.parse(JwtClaim["id"].toString());
    } catch (_) {
      rethrow;
    }
  }
}