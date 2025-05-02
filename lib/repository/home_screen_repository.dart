import 'package:cash_management_app/database/app_database.dart';
import 'package:flutter_viewmodel/bases/repository.dart';

abstract class HomeScreenRepository extends Repository {
  Future<List<DbTransactionData>> fetchTransactions();
  Future deleteTransaction(int id);
}
