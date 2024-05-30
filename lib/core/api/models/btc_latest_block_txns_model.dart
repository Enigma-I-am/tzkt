import 'dart:convert';

import 'package:equatable/equatable.dart';

class BtcLatestBlockTransactions with EquatableMixin {
  final String hash;
  final int ver;
  final String prev_block;
  final String mrkl_root;
  final int time;
  final int bits;
  final int nonce;
  final int n_tx;
  final int size;
  final int block_index;
  final bool main_chain;
  final int height;
  final int received_time;
  final String relayed_by;
  final List<Tx> tx;
  BtcLatestBlockTransactions({
    required this.hash,
    required this.ver,
    required this.prev_block,
    required this.mrkl_root,
    required this.time,
    required this.bits,
    required this.nonce,
    required this.n_tx,
    required this.size,
    required this.block_index,
    required this.main_chain,
    required this.height,
    required this.received_time,
    required this.relayed_by,
    required this.tx,
  });

  BtcLatestBlockTransactions copyWith({
    String? hash,
    int? ver,
    String? prev_block,
    String? mrkl_root,
    int? time,
    int? bits,
    int? nonce,
    int? n_tx,
    int? size,
    int? block_index,
    bool? main_chain,
    int? height,
    int? received_time,
    String? relayed_by,
    List<Tx>? tx,
  }) {
    return BtcLatestBlockTransactions(
      hash: hash ?? this.hash,
      ver: ver ?? this.ver,
      prev_block: prev_block ?? this.prev_block,
      mrkl_root: mrkl_root ?? this.mrkl_root,
      time: time ?? this.time,
      bits: bits ?? this.bits,
      nonce: nonce ?? this.nonce,
      n_tx: n_tx ?? this.n_tx,
      size: size ?? this.size,
      block_index: block_index ?? this.block_index,
      main_chain: main_chain ?? this.main_chain,
      height: height ?? this.height,
      received_time: received_time ?? this.received_time,
      relayed_by: relayed_by ?? this.relayed_by,
      tx: tx ?? this.tx,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
      'ver': ver,
      'prev_block': prev_block,
      'mrkl_root': mrkl_root,
      'time': time,
      'bits': bits,
      'nonce': nonce,
      'n_tx': n_tx,
      'size': size,
      'block_index': block_index,
      'main_chain': main_chain,
      'height': height,
      'received_time': received_time,
      'relayed_by': relayed_by,
      'tx': tx.map((x) => x.toMap()).toList(),
    };
  }

  factory BtcLatestBlockTransactions.fromMap(Map<String, dynamic> map) {
    return BtcLatestBlockTransactions(
      hash: map['hash'] ?? '',
      ver: map['ver']?.toInt() ?? 0,
      prev_block: map['prev_block'] ?? '',
      mrkl_root: map['mrkl_root'] ?? '',
      time: map['time']?.toInt() ?? 0,
      bits: map['bits']?.toInt() ?? 0,
      nonce: map['nonce']?.toInt() ?? 0,
      n_tx: map['n_tx']?.toInt() ?? 0,
      size: map['size']?.toInt() ?? 0,
      block_index: map['block_index']?.toInt() ?? 0,
      main_chain: map['main_chain'] ?? false,
      height: map['height']?.toInt() ?? 0,
      received_time: map['received_time']?.toInt() ?? 0,
      relayed_by: map['relayed_by'] ?? '',
      tx: List<Tx>.from(map['tx']?.map((x) => Tx.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory BtcLatestBlockTransactions.fromJson(String source) =>
      BtcLatestBlockTransactions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BtcLatestBlockTransactions(hash: $hash, ver: $ver, prev_block: $prev_block, mrkl_root: $mrkl_root, time: $time, bits: $bits, nonce: $nonce, n_tx: $n_tx, size: $size, block_index: $block_index, main_chain: $main_chain, height: $height, received_time: $received_time, relayed_by: $relayed_by, tx: $tx)';
  }

  @override
  List<Object?> get props => [
        hash,
        ver,
        prev_block,
        mrkl_root,
        time,
        bits,
        nonce,
        n_tx,
        size,
        block_index,
        main_chain,
        height,
        received_time,
        relayed_by,
        tx,
      ];
}

class Tx with EquatableMixin {
  final String hash;
  final int ver;
  final int vin_sz;
  final int vout_sz;
  final int lock_time;
  final int size;
  final String relayed_by;
  final int block_height;
  final int tx_index;
  // final List<Input> inputs;
  // final List<Out> out;
  Tx({
    required this.hash,
    required this.ver,
    required this.vin_sz,
    required this.vout_sz,
    required this.lock_time,
    required this.size,
    required this.relayed_by,
    required this.block_height,
    required this.tx_index,
    // required this.inputs,
    // required this.out,
  });

  Tx copyWith({
    String? hash,
    int? ver,
    int? vin_sz,
    int? vout_sz,
    int? lock_time,
    int? size,
    String? relayed_by,
    int? block_height,
    int? tx_index,
    // List<Input>? inputs,
    // List<Out>? out,
  }) {
    return Tx(
      hash: hash ?? this.hash,
      ver: ver ?? this.ver,
      vin_sz: vin_sz ?? this.vin_sz,
      vout_sz: vout_sz ?? this.vout_sz,
      lock_time: lock_time ?? this.lock_time,
      size: size ?? this.size,
      relayed_by: relayed_by ?? this.relayed_by,
      block_height: block_height ?? this.block_height,
      tx_index: tx_index ?? this.tx_index,
      // inputs: inputs ?? this.inputs,
      // out: out ?? this.out,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hash': hash,
      'ver': ver,
      'vin_sz': vin_sz,
      'vout_sz': vout_sz,
      'lock_time': lock_time,
      'size': size,
      'relayed_by': relayed_by,
      'block_height': block_height,
      'tx_index': tx_index,
      // 'inputs': inputs.map((x) => x.toMap()).toList(),
      // 'out': out.map((x) => x.toMap()).toList(),
    };
  }

  factory Tx.fromMap(Map<String, dynamic> map) {
    return Tx(
      hash: map['hash'] ?? '',
      ver: map['ver']?.toInt() ?? 0,
      vin_sz: map['vin_sz']?.toInt() ?? 0,
      vout_sz: map['vout_sz']?.toInt() ?? 0,
      lock_time: map['lock_time'] ?? '',
      size: map['size']?.toInt() ?? 0,
      relayed_by: map['relayed_by'] ?? '',
      block_height: map['block_height']?.toInt() ?? 0,
      tx_index: map['tx_index'] ?? '',
      // inputs: List<Input>.from(map['inputs']?.map((x) => Input.fromMap(x))),
      // out: List<Out>.from(map['out']?.map((x) => Out.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tx.fromJson(String source) => Tx.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tx(hash: $hash, ver: $ver, vin_sz: $vin_sz, vout_sz: $vout_sz, lock_time: $lock_time, size: $size, relayed_by: $relayed_by, block_height: $block_height, tx_index: $tx_index)';
  }

  @override
  List<Object?> get props => [
        hash,
        ver,
        vin_sz,
        vout_sz,
        lock_time,
        size,
        relayed_by,
        block_height,
        tx_index,
        // inputs,
        // out,
      ];
}

// class Input with EquatableMixin {
//   final PrevOut prev_out;
//   final String script;
//   Input({
//     required this.prev_out,
//     required this.script,
//   });

//   Input copyWith({
//     PrevOut? prev_out,
//     String? script,
//   }) {
//     return Input(
//       prev_out: prev_out ?? this.prev_out,
//       script: script ?? this.script,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'prev_out': prev_out.toMap(),
//       'script': script,
//     };
//   }

//   factory Input.fromMap(Map<String, dynamic> map) {
//     return Input(
//       prev_out: PrevOut.fromMap(map['prev_out']),
//       script: map['script'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Input.fromJson(String source) => Input.fromMap(json.decode(source));

//   @override
//   List<Object?> get props => [prev_out, script];
// }

// class PrevOut with EquatableMixin {
//   final String hash;
//   final int value;
//   final String tx_index;
//   final String n;
//   PrevOut({
//     required this.hash,
//     required this.value,
//     required this.tx_index,
//     required this.n,
//   });

//   PrevOut copyWith({
//     String? hash,
//     int? value,
//     String? tx_index,
//     String? n,
//   }) {
//     return PrevOut(
//       hash: hash ?? this.hash,
//       value: value ?? this.value,
//       tx_index: tx_index ?? this.tx_index,
//       n: n ?? this.n,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'hash': hash,
//       'value': value,
//       'tx_index': tx_index,
//       'n': n,
//     };
//   }

//   factory PrevOut.fromMap(Map<String, dynamic> map) {
//     return PrevOut(
//       hash: map['hash'] ?? '',
//       value: map['value'] ?? '',
//       tx_index: map['tx_index'] ?? '',
//       n: map['n'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory PrevOut.fromJson(String source) =>
//       PrevOut.fromMap(json.decode(source));

//   @override
//   List<Object?> get props => [
//         hash,
//         value,
//         tx_index,
//         n,
//       ];
// }

// class Out with EquatableMixin {
//   final String value;
//   final String hash;
//   final String script;
//   Out({
//     required this.value,
//     required this.hash,
//     required this.script,
//   });

//   Out copyWith({
//     String? value,
//     String? hash,
//     String? script,
//   }) {
//     return Out(
//       value: value ?? this.value,
//       hash: hash ?? this.hash,
//       script: script ?? this.script,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'value': value,
//       'hash': hash,
//       'script': script,
//     };
//   }

//   factory Out.fromMap(Map<String, dynamic> map) {
//     return Out(
//       value: map['value'] ?? '',
//       hash: map['hash'] ?? '',
//       script: map['script'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Out.fromJson(String source) => Out.fromMap(json.decode(source));

//   @override
//   List<Object?> get props => [
//         value,
//         hash,
//         script,
//       ];
// }
