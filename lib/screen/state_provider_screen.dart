import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/state_provider.dart';

//Riverpod을 사용하기 위해 ConsumerWidget을 상속받는다.
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProvider',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).update((state) => state + 1);
                  },
                  child: const Text('Up')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
                  },
                  child: const Text('Down')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const _NextScreen()));
                  },
                  child: const Text('Next Screen'))
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProvider',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).update((state) => state + 1);
                  },
                  child: const Text('Up'))
            ],
          ),
        ));
    ;
  }
}
