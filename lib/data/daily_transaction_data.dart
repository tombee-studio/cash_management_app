import 'package:cash_management_app/data/transaction_type.dart';
import 'package:cash_management_app/database/app_database.dart';

final class DailyTransactionData {
  final DateTime date;
  int _income;
  int _expence;
  int _sum;

  int get income => _income;
  int get expence => _expence;
  int get sum => _sum;

  DailyTransactionData(this.date, this._income, this._expence, this._sum);

  void update(DbTransactionData data) {
    if (TransactionType.values[data.transactionType] ==
        TransactionType.income) {
      _income += data.cost;
      _sum += _income;
    } else {
      _expence += data.cost;
      _sum -= _expence;
    }
  }
}
