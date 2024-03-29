import 'package:hive/hive.dart';

// The below file will be auto generated by Hive. Contains the generated classes
part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  late double amount;

  @HiveField(1)
  late bool isDebited;

  @HiveField(2)
  late DateTime date;

  @HiveField(3)
  late String bankName;

  @HiveField(4)
  late String transactionCategory = "Other";
}
