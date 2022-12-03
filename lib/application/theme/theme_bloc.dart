import 'package:bloc/bloc.dart';
import 'package:flutter_frontier/application/core/ui_objects.dart';
import 'package:flutter_frontier/domain/save_box/save_box.dart';
import 'package:flutter_frontier/schema/prefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(SaveBox saveBox) : super(const ThemeState.initial()) {
    on<ThemeEvent>((event, emit) async {
      await event.map(
        started: (e) async {
          SaveThemeType? saveThemeType = await readThemePref(saveBox: saveBox);

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
              saveThemePref(
                  saveBox: saveBox, saveThemeType: SaveThemeType.light);
            },
            dark: (value) async {
              emit(const ThemeState.dark());
              saveThemePref(
                  saveBox: saveBox, saveThemeType: SaveThemeType.dark);
            },
          );
        },
      );
    });
  }

  void saveThemePref(
      {required SaveBox saveBox, required SaveThemeType saveThemeType}) {
    saveBox.save(object: Prefs(saveThemeType));
  }

  Future<SaveThemeType?> readThemePref({
    required SaveBox saveBox,
  }) async {
    return (await saveBox.read<Prefs, int>(key: 0))?.saveThemeType;
  }
}

enum SaveThemeType {
  light,
  dark,
}
