import 'package:cash_management_app/data/daily_transaction_data.dart';
import 'package:cash_management_app/screen/component/transaction_list_item.dart';
import 'package:cash_management_app/screen/transaction_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cash_management_app/data/home_screen_state.dart';
import 'package:cash_management_app/model/home_screen_model.dart';
import 'package:cash_management_app/model/repository/home_screen_app_repository.dart';
import 'package:cash_management_app/repository/home_screen_repository.dart';
import 'package:cash_management_app/screen/pages/home_page.dart';
import 'package:cash_management_app/screen/pages/list_page.dart';
import 'package:cash_management_app/screen/pages/settings_page.dart';
import 'package:flutter_viewmodel/bases/notifier.dart';
import 'package:flutter_viewmodel/bases/repository_provider.dart';
import 'package:flutter_viewmodel/bases/view_model.dart';
import 'package:intl/intl.dart';

final homeScreenRepositoryProvider =
    RepositoryProvider<HomeScreenRepository>(() => HomeScreenAppRepository());

class HomeScreenViewModel extends ViewModel<HomeScreenModel> {
  HomeScreenViewModel(super.notifier);

  @override
  HomeScreenModel createModel(Notifier notifier) =>
      HomeScreenModel(notifier, homeScreenRepositoryProvider);

  HomeScreenState get currentState => model.currentState;
  set currentState(value) => model.currentState = value;

  Widget? get body {
    switch (currentState) {
      case HomeScreenState.home:
        return HomePage(parentViewModel: this);
      case HomeScreenState.list:
        return ListPage(parentViewModel: this);
      case HomeScreenState.settings:
        return SettingsPage(parentViewModel: this);
    }
  }

  Widget? floatingActionButton(BuildContext context) {
    if (currentState == HomeScreenState.list) {
      return FloatingActionButton(
          onPressed: () => onPressed(context), child: const Icon(Icons.add));
    }
    return null;
  }

  Widget get transactionList {
    return ListView(
        children: model.transactions
            .map((item) => TransactionListItem(item, parentViewModel: this))
            .toList());
  }

  void onPressed(BuildContext context) {
    showDialog(
        context: context, builder: (context) => const TransactionScreen());
  }

  void load() {
    model.load();
  }

  void deleteTransaction(int id) async {
    model.deleteTransaction(id);
  }

  Widget getTransactionChart(BuildContext context) {
    final dailyTransactions = <DailyTransactionData>[];
    var dailyTransaction =
        DailyTransactionData(DateTime.fromMicrosecondsSinceEpoch(0), 0, 0, 0);
    for (var transaction in model.transactions) {
      final transactionDate = transaction.transactionDate;
      final date = DateTime(
          transactionDate.year, transactionDate.month, transactionDate.day);
      if (!dailyTransaction.date.isAtSameMomentAs(date)) {
        final dailyItem =
            DailyTransactionData(date, 0, 0, dailyTransaction.sum);
        dailyTransactions.add(dailyItem);
        dailyTransaction = dailyItem;
      }
      dailyTransaction.update(transaction);
    }
    final formatter = DateFormat("M月d日");
    return BarChart(BarChartData(
        titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(formatter.format(
                        DateTime.fromMicrosecondsSinceEpoch(value.toInt())))))),
        barGroups: dailyTransactions
            .map((item) => BarChartGroupData(
                    x: item.date.microsecondsSinceEpoch,
                    barRods: <BarChartRodData>[
                      BarChartRodData(
                          toY: item.expence.toDouble(), color: Colors.red),
                      BarChartRodData(
                          toY: item.income.toDouble(), color: Colors.lightGreen)
                    ]))
            .toList()));
  }

  Widget getSumChart(BuildContext context) {
    final dailyTransactions = <DailyTransactionData>[];
    var dailyTransaction =
        DailyTransactionData(DateTime.fromMicrosecondsSinceEpoch(0), 0, 0, 0);
    for (var transaction in model.transactions) {
      final transactionDate = transaction.transactionDate;
      final date = DateTime(
          transactionDate.year, transactionDate.month, transactionDate.day);
      if (!dailyTransaction.date.isAtSameMomentAs(date)) {
        final dailyItem =
            DailyTransactionData(date, 0, 0, dailyTransaction.sum);
        dailyTransactions.add(dailyItem);
        dailyTransaction = dailyItem;
      }
      dailyTransaction.update(transaction);
    }
    final formatter = DateFormat("M月d日");
    return LineChart(LineChartData(
        titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) => Text(formatter.format(
                        DateTime.fromMicrosecondsSinceEpoch(value.toInt())))))),
        lineBarsData: [
          LineChartBarData(
              spots: dailyTransactions
                  .map((item) => FlSpot(
                      item.date.microsecondsSinceEpoch.toDouble(),
                      item.sum.toDouble()))
                  .toList())
        ]));
  }
}
