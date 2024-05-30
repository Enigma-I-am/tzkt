import 'dart:convert';

import 'package:equatable/equatable.dart';

class TezosBlocks with EquatableMixin {
  final List<Tezosblockmodel> data;
  TezosBlocks({required this.data});

  factory TezosBlocks.fromMap(Map<String, dynamic> map) {
    return TezosBlocks(
      data: List.from(
        (map['data'] ?? []).map(
          (x) => Tezosblockmodel.fromMap(x),
        ),
      ),
    );
  }

    factory TezosBlocks.fromJson(String source) =>
      TezosBlocks.fromMap(json.decode(source));
  @override
  List<Object?> get props => [data];
}

class Tezosblockmodel with EquatableMixin {
  final int cycle;
  final int level; // ✅
  final String hash; // ✅
  final String timestamp; // ✅
  final int proto;
  final int payloadRound;
  final int blockRound;
  final int validations;
  final int deposit;
  final int rewardLiquid; // ✅
  final int rewardStakedOwn; // ✅
  final int rewardStakedShared; // ✅
  final int bonusLiquid;
  final int bonusStakedOwn;
  final int bonusStakedShared;
  final int fees; // ✅
  final bool nonceRevealed;
  final bool lbToggle;
  final int lbToggleEma;
  final bool aiToggle;
  final int aiToggleEma;
  final int reward; // ✅
  final int bonus; // ✅
  final int priority;
  final bool lbEscapeVote;
  final int lbEscapeEma;
  Tezosblockmodel({
    required this.cycle,
    required this.level,
    required this.hash,
    required this.timestamp,
    required this.proto,
    required this.payloadRound,
    required this.blockRound,
    required this.validations,
    required this.deposit,
    required this.rewardLiquid,
    required this.rewardStakedOwn,
    required this.rewardStakedShared,
    required this.bonusLiquid,
    required this.bonusStakedOwn,
    required this.bonusStakedShared,
    required this.fees,
    required this.nonceRevealed,
    required this.lbToggle,
    required this.lbToggleEma,
    required this.aiToggle,
    required this.aiToggleEma,
    required this.reward,
    required this.bonus,
    required this.priority,
    required this.lbEscapeVote,
    required this.lbEscapeEma,
  });

  Tezosblockmodel copyWith({
    int? cycle,
    int? level,
    String? hash,
    String? timestamp,
    int? proto,
    int? payloadRound,
    int? blockRound,
    int? validations,
    int? deposit,
    int? rewardLiquid,
    int? rewardStakedOwn,
    int? rewardStakedShared,
    int? bonusLiquid,
    int? bonusStakedOwn,
    int? bonusStakedShared,
    int? fees,
    bool? nonceRevealed,
    bool? lbToggle,
    int? lbToggleEma,
    bool? aiToggle,
    int? aiToggleEma,
    int? reward,
    int? bonus,
    int? priority,
    bool? lbEscapeVote,
    int? lbEscapeEma,
  }) {
    return Tezosblockmodel(
      cycle: cycle ?? this.cycle,
      level: level ?? this.level,
      hash: hash ?? this.hash,
      timestamp: timestamp ?? this.timestamp,
      proto: proto ?? this.proto,
      payloadRound: payloadRound ?? this.payloadRound,
      blockRound: blockRound ?? this.blockRound,
      validations: validations ?? this.validations,
      deposit: deposit ?? this.deposit,
      rewardLiquid: rewardLiquid ?? this.rewardLiquid,
      rewardStakedOwn: rewardStakedOwn ?? this.rewardStakedOwn,
      rewardStakedShared: rewardStakedShared ?? this.rewardStakedShared,
      bonusLiquid: bonusLiquid ?? this.bonusLiquid,
      bonusStakedOwn: bonusStakedOwn ?? this.bonusStakedOwn,
      bonusStakedShared: bonusStakedShared ?? this.bonusStakedShared,
      fees: fees ?? this.fees,
      nonceRevealed: nonceRevealed ?? this.nonceRevealed,
      lbToggle: lbToggle ?? this.lbToggle,
      lbToggleEma: lbToggleEma ?? this.lbToggleEma,
      aiToggle: aiToggle ?? this.aiToggle,
      aiToggleEma: aiToggleEma ?? this.aiToggleEma,
      reward: reward ?? this.reward,
      bonus: bonus ?? this.bonus,
      priority: priority ?? this.priority,
      lbEscapeVote: lbEscapeVote ?? this.lbEscapeVote,
      lbEscapeEma: lbEscapeEma ?? this.lbEscapeEma,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cycle': cycle,
      'level': level,
      'hash': hash,
      'timestamp': timestamp,
      'proto': proto,
      'payloadRound': payloadRound,
      'blockRound': blockRound,
      'validations': validations,
      'deposit': deposit,
      'rewardLiquid': rewardLiquid,
      'rewardStakedOwn': rewardStakedOwn,
      'rewardStakedShared': rewardStakedShared,
      'bonusLiquid': bonusLiquid,
      'bonusStakedOwn': bonusStakedOwn,
      'bonusStakedShared': bonusStakedShared,
      'fees': fees,
      'nonceRevealed': nonceRevealed,
      'lbToggle': lbToggle,
      'lbToggleEma': lbToggleEma,
      'aiToggle': aiToggle,
      'aiToggleEma': aiToggleEma,
      'reward': reward,
      'bonus': bonus,
      'priority': priority,
      'lbEscapeVote': lbEscapeVote,
      'lbEscapeEma': lbEscapeEma,
    };
  }

  factory Tezosblockmodel.fromMap(Map<String, dynamic> map) {
    return Tezosblockmodel(
      cycle: map['cycle']?.toInt() ?? 0,
      level: map['level']?.toInt() ?? 0,
      hash: map['hash'] ?? '',
      timestamp: map['timestamp'] ?? '',
      proto: map['proto']?.toInt() ?? 0,
      payloadRound: map['payloadRound']?.toInt() ?? 0,
      blockRound: map['blockRound']?.toInt() ?? 0,
      validations: map['validations']?.toInt() ?? 0,
      deposit: map['deposit']?.toInt() ?? 0,
      rewardLiquid: map['rewardLiquid']?.toInt() ?? 0,
      rewardStakedOwn: map['rewardStakedOwn']?.toInt() ?? 0,
      rewardStakedShared: map['rewardStakedShared']?.toInt() ?? 0,
      bonusLiquid: map['bonusLiquid']?.toInt() ?? 0,
      bonusStakedOwn: map['bonusStakedOwn']?.toInt() ?? 0,
      bonusStakedShared: map['bonusStakedShared']?.toInt() ?? 0,
      fees: map['fees']?.toInt() ?? 0,
      nonceRevealed: map['nonceRevealed'] ?? false,
      lbToggle: map['lbToggle'] ?? false,
      lbToggleEma: map['lbToggleEma']?.toInt() ?? 0,
      aiToggle: map['aiToggle'] ?? false,
      aiToggleEma: map['aiToggleEma']?.toInt() ?? 0,
      reward: map['reward']?.toInt() ?? 0,
      bonus: map['bonus']?.toInt() ?? 0,
      priority: map['priority']?.toInt() ?? 0,
      lbEscapeVote: map['lbEscapeVote'] ?? false,
      lbEscapeEma: map['lbEscapeEma']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tezosblockmodel.fromJson(String source) =>
      Tezosblockmodel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        cycle,
        level,
        hash,
        timestamp,
        proto,
        payloadRound,
        blockRound,
        validations,
        deposit,
        rewardLiquid,
        rewardStakedOwn,
        rewardStakedShared,
        bonusLiquid,
        bonusStakedOwn,
        bonusStakedShared,
        fees,
        nonceRevealed,
        lbToggle,
        lbToggleEma,
        reward,
        bonus,
        priority,
        lbEscapeVote,
        lbEscapeEma,
      ];
}
