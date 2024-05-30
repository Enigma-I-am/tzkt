import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tzkt/counter/counter.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(BlockCubit().state, equals(0));
    });

    blocTest<BlockCubit, int>(
      'emits [1] when increment is called',
      build: BlockCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<BlockCubit, int>(
      'emits [-1] when decrement is called',
      build: BlockCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
