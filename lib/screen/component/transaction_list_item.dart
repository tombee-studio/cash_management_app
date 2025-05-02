import 'package:cash_management_app/data/transaction_type.dart';
import 'package:cash_management_app/database/app_database.dart';
import 'package:cash_management_app/screen/transaction_screen.dart';
import 'package:cash_management_app/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_viewmodel/bases/view_model_widget.dart';

class TransactionListItem extends ViewModelWidget<HomeScreenViewModel> {
  final DbTransactionData _transaction;

  const TransactionListItem(this._transaction,
      {super.key, required super.parentViewModel});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onUpdate,
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: '編集',
            ),
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: '削除',
            )
          ],
        ),
        child: ListTile(
            leading: _icon,
            title: Text("¥${_transaction.cost}"),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_transaction.name),
              Text(_transaction.transactionDate.toString()),
            ])));
  }

  Widget get _icon {
    final iconType = TransactionType.values[_transaction.transactionType];
    switch (iconType) {
      case TransactionType.income:
        return const Icon(Icons.arrow_circle_up, color: Colors.green);
      case TransactionType.expence:
        return const Icon(Icons.arrow_circle_down, color: Colors.red);
    }
  }

  void onUpdate(BuildContext context) {
    showDialog(
            context: context,
            builder: (context) => TransactionScreen(data: _transaction))
        .then((value) => parentViewModel.load());
  }

  void onDelete(BuildContext context) {
    parentViewModel.deleteTransaction(_transaction.id);
  }
}
