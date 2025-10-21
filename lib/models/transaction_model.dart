import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  final String id;
  final String fromAddress;
  final String toAddress;
  final double amount;
  final String status;
  final DateTime timestamp;
  final String? transactionHash;
  final bool isBurnTransaction;
  final String? privateKey;
  final DateTime? date;

  const TransactionModel({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    required this.status,
    required this.timestamp,
    this.transactionHash,
    this.isBurnTransaction = false,
    this.privateKey,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionModel copyWith({
    String? id,
    String? fromAddress,
    String? toAddress,
    double? amount,
    String? status,
    DateTime? timestamp,
    String? transactionHash,
    bool? isBurnTransaction,
    String? privateKey,
    DateTime? date,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      fromAddress: fromAddress ?? this.fromAddress,
      toAddress: toAddress ?? this.toAddress,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      transactionHash: transactionHash ?? this.transactionHash,
      isBurnTransaction: isBurnTransaction ?? this.isBurnTransaction,
      privateKey: privateKey ?? this.privateKey,
      date: date ?? this.date,
    );
  }

  @override
  String toString() {
    return 'TransactionModel(id: $id, fromAddress: $fromAddress, toAddress: $toAddress, amount: $amount, status: $status, timestamp: $timestamp, transactionHash: $transactionHash, isBurnTransaction: $isBurnTransaction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionModel &&
        other.id == id &&
        other.fromAddress == fromAddress &&
        other.toAddress == toAddress &&
        other.amount == amount &&
        other.status == status &&
        other.timestamp == timestamp &&
        other.transactionHash == transactionHash &&
        other.isBurnTransaction == isBurnTransaction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fromAddress.hashCode ^
        toAddress.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        timestamp.hashCode ^
        transactionHash.hashCode ^
        isBurnTransaction.hashCode;
  }
}