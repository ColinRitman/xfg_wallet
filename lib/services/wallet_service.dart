import '../models/transaction_model.dart';

class WalletService {
  static Future<List<TransactionModel>> getTransactions() async {
    // This is a placeholder implementation
    // In a real app, this would fetch from a database or API
    return [];
  }

  static Future<void> saveTransaction(TransactionModel transaction) async {
    // This is a placeholder implementation
    // In a real app, this would save to a database
  }
}