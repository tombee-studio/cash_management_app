import 'package:cash_management_app/data/home_screen_state.dart';
import 'package:cash_management_app/database/app_database.dart';
import 'package:cash_management_app/repository/home_screen_repository.dart';
import 'package:flutter_viewmodel/bases/list_property.dart';
import 'package:flutter_viewmodel/bases/model.dart';
import 'package:flutter_viewmodel/bases/property.dart';

class HomeScreenModel extends Model<HomeScreenRepository> {
  late ListProperty<DbTransactionData> _transactions;
  late Property<HomeScreenState> _currentState;

  HomeScreenState get currentState => _currentState.value;
  set currentState(HomeScreenState value) => _currentState.value = value;

  List<DbTransactionData> get transactions => _transactions.value;

  HomeScreenModel(super.notifier, super.provider) {
    _currentState = propertyOf<HomeScreenState>(HomeScreenState.home);
    _transactions = listPropertyOf<DbTransactionData>([]);

    load();
  }

  void load() async {
    _transactions.value = await repository.fetchTransactions();
  }

  Future deleteTransaction(int id) async {
    await repository.deleteTransaction(id);
    load();
  }
}
