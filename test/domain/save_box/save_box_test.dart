// import 'package:hive/hive.dart';

import 'package:flutter_frontier/domain/save_box/save_box.dart';
import 'package:mockito/annotations.dart';

// abstract class SaveBox {
//   Future<int> write<T>({required T object});

//   Future<T?> read<T, X>({required X key});
// }

// class SaveBoxImpl implements SaveBox {
//   SaveBoxImpl(this.isar);
//   final Isar isar;

//   @override
//   Future<T?> read<T, X>({required X key}) async {
//     if (X is int) {
//       return (await isar.collection<T>().get(key as int));
//     }
//     throw Exception('required Type:key must be of type int');
//   }

//   @override
//   Future<int> write<T>({required T object}) async {
//     return isar.writeTxn(
//       () => isar.collection<T>().put(
//             object,
//           ),
//     );
//   }
// }

@GenerateNiceMocks([MockSpec<SaveBox>()])
void main() {
  SaveBoxImpl saveBoxImpl;
}
