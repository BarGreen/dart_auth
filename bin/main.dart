import 'dart:io' ;

import 'package:conduit/conduit.dart';
import 'package:dart_auth/dart_auth.dart';
import 'package:dart_auth/utils/app_env.dart';

Future<void> main(List<String> arguments) async {
  final port = int.tryParse(AppEnv.port) ?? 0;
  final service = Application<AppService>()..options.port = port;
  await service.start(numberOfInstances: 3, consoleLogging: true);
}
