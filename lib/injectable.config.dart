// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_frontier/application/theme/theme_bloc.dart' as _i5;
import 'package:flutter_frontier/domain/save_box/save_box.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i3;

import 'modules.dart' as _i6;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.singletonAsync<_i3.Isar>(
    () => registerModule.isar,
    preResolve: true,
  );
  gh.lazySingleton<_i4.SaveBox>(() => _i4.SaveBoxImpl(gh<_i3.Isar>()));
  gh.factory<_i5.ThemeBloc>(() => _i5.ThemeBloc(gh<_i4.SaveBox>()));
  return getIt;
}

class _$RegisterModule extends _i6.RegisterModule {}
