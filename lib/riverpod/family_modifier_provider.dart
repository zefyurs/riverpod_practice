import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 1));

  return List.generate(5, (index) => index * data);
  // return [1, 2, 3];
});
