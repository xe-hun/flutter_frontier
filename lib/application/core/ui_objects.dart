// enum ThemeType { light, dark }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_objects.freezed.dart';

@freezed
class ThemeType with _$ThemeType {
  const factory ThemeType.light() = _Light;
  const factory ThemeType.dark() = _Dark;
}
