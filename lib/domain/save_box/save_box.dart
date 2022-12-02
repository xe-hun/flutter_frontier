// import 'package:hive/hive.dart';

import 'package:isar/isar.dart';

abstract class SaveBox {
  Future<int> write<T>({required T object});

  Future<T?> read<T, X>({required X key});
}

class SaveBoxImpl implements SaveBox {
  SaveBoxImpl(this.isar);
  final Isar isar;

  @override
  Future<T?> read<T, X>({required X key}) async {
    if (X is int) {
      return (await isar.collection<T>().get(key as int));
    }
    throw Exception('required Type:key must be of type int');
  }

  @override
  Future<int> write<T>({required T object}) async {
    return isar.writeTxn(
      () => isar.collection<T>().put(
            object,
          ),
    );
  }
} 

// void writeThemePref(
//       {required Isar isar, required SaveThemeType saveThemeType}) {
//     isar.writeTxn(
//       () => isar.prefs.put(
//         Prefs(saveThemeType),
//       ),
//     );
//   }

//   Future<SaveThemeType?> readThemePref({
//     required Isar isar,
//   }) async {
//     return (await isar.prefs.get(0))?.saveThemeType;
//   }
// }





