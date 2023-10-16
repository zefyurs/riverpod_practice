import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // 전체 데이터를 가져온다
    // final state = ref.watch(selectProvider);
    // 특정 데이터만 가져온다
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // listen에서 select를 사용할 경우 화면을 Build되지 않아도 데이터 값을 가져오 수 있음
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, current) {
      print('previous: $previous, current: $current');
    });

    // 화면의 build가 필요하다면, ref.watch를 사용한다.

    return DefaultLayout(
        title: 'Select provider screen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 전체데이터를 가져오는경우
              // Text(state.name),
              // Text(state.hasBought.toString()),
              // Text(state.isSpicy.toString()),
              Text(state.toString()),

              // 특정 값만 가져올 경우, 이 경우 hasBought는 화면에 나오는 값과 관련이 없기 때문에
              // 화면이 다시 그려지지 않는다.
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleHasBought();
                  },
                  child: const Text('구매여부')),
              // selectProvider의 경우 특정 값만 가져오기 때문에 화면이 다시 그려진다.
              ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: const Text('매워 안매워?')),
            ],
          ),
        ));
  }
}
