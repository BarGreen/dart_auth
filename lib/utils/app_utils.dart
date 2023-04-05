import 'package:conduit/conduit.dart';
import 'package:dart_auth/utils/app_env.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

abstract class AppUtils {
  // пустой конструктор. 
  // таким образом мы не сможем создать экз.данного класса.
  const AppUtils._();

  static int getIdFromToken(String token) {
    try {
      final JwtClaim = verifyJwtHS256Signature(token, AppEnv.secretKey);
      return int.parse(JwtClaim["id"].toString());
    } catch (_) {
      rethrow;
    }
  }

  static int getIdFromHeader(String header) {
    try {
      final token = AuthorizationBearerParser().parse(header);
      return getIdFromToken(token ?? "");
    } catch (_) {
      rethrow;
    }
  }
}