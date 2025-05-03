import 'package:cash_management_app/data/transaction_type.dart';
import 'package:cash_management_app/database/app_database.dart';

final class DailyTransactionData {
  final DateTime date;
  int _income;
  int _expence;

  int get income => _income;
  int get expence => _expence;

  DailyTransactionData(this.date, this._income, this._expence);

  void update(DbTransactionData data) {
    if (TransactionType.values[data.transactionType] ==
        TransactionType.income) {
      _income += data.cost;
    } else {
      _expence += data.cost;
    }
  }
}
