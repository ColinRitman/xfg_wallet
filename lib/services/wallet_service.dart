import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/wallet.dart';
import '../models/transaction_model.dart';

class WalletService {
  static const String _baseUrl = 'https://api.fuego.org';

  /// Get wallet balance
  static Future<double> getBalance(String address) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/balance/$address'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['balance'] as num).toDouble();
      } else {
        throw Exception('Failed to get balance: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting balance: $e');
      }
      return 0.0;
    }
  }

  /// Send transaction
  static Future<Map<String, dynamic>> sendTransaction({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required String privateKey,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/send'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'from': fromAddress,
          'to': toAddress,
          'amount': amount,
          'privateKey': privateKey,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send transaction: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error sending transaction: $e');
      }
      rethrow;
    }
  }

  /// Get transaction history
  static Future<List<Map<String, dynamic>>> getTransactionHistory(String address) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/transactions/$address'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['transactions']);
      } else {
        throw Exception('Failed to get transaction history: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting transaction history: $e');
      }
      return [];
    }
  }

  /// Create new wallet
  static Future<Wallet> createWallet() async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/wallet/create'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Wallet.fromJson(data);
      } else {
        throw Exception('Failed to create wallet: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating wallet: $e');
      }
      rethrow;
    }
  }

  /// Get transactions for burn deposits
  static Future<List<TransactionModel>> getTransactions(String address) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/transactions/$address'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final transactions = List<Map<String, dynamic>>.from(data['transactions']);
        return transactions.map((json) => TransactionModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get transactions: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error getting transactions: $e');
      }
      return [];
    }
  }
}