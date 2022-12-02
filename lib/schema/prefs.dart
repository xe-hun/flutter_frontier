import 'package:flutter_frontier/application/theme/theme_bloc.dart';
import 'package:isar/isar.dart';

part 'prefs.g.dart';

@collection
class Prefs {
  Prefs(this.saveThemeType);
  Id id = 0;
  @Enumerated(EnumType.ordinal32)
  SaveThemeType? saveThemeType;
}
