import 'dart:convert';

import 'package:equatable/equatable.dart';

class BtcLatestBlockModel with EquatableMixin {
  final String hash;
  final int time;
  final int block_index;
  final int height;
  final List<int> txIndexes;
  BtcLatestBlockModel({
    required this.hash,
    required this.time,
    required this.block_index,
    required this.height,
    required this.txIndexes,
  });

  BtcLatestBlockModel copyWith({
    String? hash,
    int? time,
    int? block_index,
    int? height,
    List<int>? txIndexes,
  }) {
    return BtcLatestBlockModel(
      hash: hash ?? this.hash,
      time: time ?? this.time,
      block_index: block_index ?? this.block_index,
      height: height ?? this.height,
      txIndexes: txIndexes ?? this.txIndexes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
      'time': time,
      'block_index': block_index,
      'height': height,
      'txIndexes': txIndexes,
    };
  }

  factory BtcLatestBlockModel.fromMap(Map<String, dynamic> map) {
    return BtcLatestBlockModel(
      hash: map['hash'] ?? '',
      time: map['time']?.toInt() ?? 0,
      block_index: map['block_index']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
      txIndexes: List<int>.from(map['txIndexes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BtcLatestBlockModel.fromJson(String source) =>
      BtcLatestBlockModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BtcLatestBlockModel(hash: $hash, time: $time, block_index: $block_index, height: $height, txIndexes: $txIndexes)';
  }

  @override
  List<Object?> get props => [
        hash,
        time,
        block_index,
        height,
      ];
}
