class TransactionModel {
  final String id;
  final String hash;
  final int amount;
  final String type;
  final DateTime timestamp;
  final bool isBurnTransaction;
  final String? recipientAddress;

  TransactionModel({
    required this.id,
    required this.hash,
    required this.amount,
    required this.type,
    required this.timestamp,
    this.isBurnTransaction = false,
    this.recipientAddress,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      hash: json['hash'] ?? '',
      amount: json['amount'] ?? 0,
      type: json['type'] ?? '',
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      isBurnTransaction: json['isBurnTransaction'] ?? false,
      recipientAddress: json['recipientAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hash': hash,
      'amount': amount,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
      'isBurnTransaction': isBurnTransaction,
      'recipientAddress': recipientAddress,
    };
  }
}