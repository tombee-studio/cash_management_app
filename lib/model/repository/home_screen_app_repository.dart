import 'package:cash_management_app/database/app_database.dart';
import 'package:cash_management_app/repository/home_screen_repository.dart';

class HomeScreenAppRepository extends HomeScreenRepository {
  @override
  Future<List<DbTransactionData>> fetchTransactions() async {
    return await AppDatabase().fetchTransactions();
  }

  @override
  Future deleteTransaction(int id) async {
    await AppDatabase().deleteTransaction(id);
  }
}
