import 'package:bloc/bloc.dart';
import 'package:flutter_frontier/application/core/ui_objects.dart';
import 'package:flutter_frontier/schema/prefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(Isar isar) : super(const ThemeState.initial()) {
    on<ThemeEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          SaveThemeType? saveThemeType = await readThemePref(isar: isar);
          switch (saveThemeType) {
            case SaveThemeType.light:
              emit(const ThemeState.light());
              break;
            case SaveThemeType.dark:
              emit(const ThemeState.dark());
              break;
            default:
              emit(const ThemeState.light());
              break;
          }
        },
        changeTheme: (e) async {
          await e.themeType.map(
            light: (value) async {
              emit(const ThemeState.light());
              writeThemePref(isar: isar, saveThemeType: SaveThemeType.light);
            },
            dark: (value) async {
              emit(const ThemeState.dark());
              writeThemePref(isar: isar, saveThemeType: SaveThemeType.dark);
            },
          );
        },
      );
    });
  }

  void writeThemePref(
      {required Isar isar, required SaveThemeType saveThemeType}) {
    isar.writeTxn(
      () => isar.prefs.put(
        Prefs(saveThemeType),
      ),
    );
  }

  Future<SaveThemeType?> readThemePref({
    required Isar isar,
  }) async {
    return (await isar.prefs.get(0))?.saveThemeType;
  }
}

enum SaveThemeType {
  light,
  dark,
}
