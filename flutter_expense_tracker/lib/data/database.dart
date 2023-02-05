import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/data/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future initiateHiveDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionModelAdapter());

  // Open a Hive box and give it a name
  debugPrint("Opening Hive Box - transactions");
  await Hive.openBox<TransactionModel>('transactions');
}

void closeHiveDatabase() {
  Hive.close();
}

void addTransaction(double amount, bool isDebited, DateTime date,
    String bankName, String transactionCategory) {
  final transaction = TransactionModel()
    ..amount = amount
    ..isDebited = isDebited
    ..date = DateTime.now()
    ..bankName = bankName
    ..transactionCategory = transactionCategory;

  final box = Hive.box<TransactionModel>('transactions');
  box.add(transaction);
  // box.put('key', transaction);
}

// Return N number of transactions
// List<TransactionModel> getNTransactions(int n) {
//   final box = Hive.box<TransactionModel>('transactions');
// }

List<TransactionModel> getAllTransactions() {
  final box = Hive.box<TransactionModel>('transactions');
  return box.values.toList();
}

// deletes all data in box
Future<void> clearHiveBox() async {
  final box = Hive.box<TransactionModel>('transactions');

  // box.clear is async, hence we must await
  await box.clear();
}

void printLengthOfBox() {
  final box = Hive.box<TransactionModel>('transactions');
  debugPrint("Length of transactions box: ${box.length}");
}
