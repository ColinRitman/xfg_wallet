// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as String,
      fromAddress: json['fromAddress'] as String,
      toAddress: json['toAddress'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      transactionHash: json['transactionHash'] as String?,
      isBurnTransaction: json['isBurnTransaction'] as bool? ?? false,
      privateKey: json['privateKey'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromAddress': instance.fromAddress,
      'toAddress': instance.toAddress,
      'amount': instance.amount,
      'status': instance.status,
      'timestamp': instance.timestamp.toIso8601String(),
      'transactionHash': instance.transactionHash,
      'isBurnTransaction': instance.isBurnTransaction,
      'privateKey': instance.privateKey,
    };