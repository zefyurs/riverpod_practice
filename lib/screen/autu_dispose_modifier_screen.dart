import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AutoDisposeModifierProvider);
    return DefaultLayout(
        title: 'autoDisposeModifier Screen',
        body: Center(
            child: state.when(
                data: (data) => Text(data.toString()),
                error: (err, stack) => Text(err.toString()),
                loading: () => CircularProgressIndicator())));
  }
}
