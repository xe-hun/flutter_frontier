import 'package:flutter_frontier/schema/prefs.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Isar> get isar => Isar.open([PrefsSchema]);
}
