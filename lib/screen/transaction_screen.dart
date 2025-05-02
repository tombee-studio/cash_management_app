import 'package:cash_management_app/data/transaction_type.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:cash_management_app/database/app_database.dart';
import 'package:flutter_viewmodel/bases/notifier.dart';
import 'package:flutter_viewmodel/bases/property.dart';
import 'package:flutter_viewmodel/bases/crud_repository.dart';
import 'package:flutter_viewmodel/bases/repository_provider.dart';
import 'package:flutter_viewmodel/bases/crud_model_stateful_widget.dart';
import 'package:flutter_viewmodel/bases/crud_repository_factory.dart';

final transactionRepositoryProvider = RepositoryProvider<
        CrudRepository<DbTransactionData, DbTransactionCompanion>>(
    () => _TransactionCrudAppRepository());

class TransactionScreen extends CrudModelStatefulWidget<DbTransactionData> {
  const TransactionScreen({super.key, super.data});

  @override
  State<StatefulWidget> createState() => TransactionScreenState();
}

class TransactionScreenState extends CrudModelStatefulWidgetState<
    DbTransactionData, DbTransactionCompanion> {
  @override
  Widget build(BuildContext context) {
    final model = viewModel.model as _TransactionModel;
    final buttons = <Widget>[];
    buttons.add(TextButton(onPressed: onCancel, child: const Text("キャンセル")));
    if (widget.data == null) {
      buttons.add(TextButton(onPressed: onCreate, child: const Text("作成")));
    } else {
      buttons.add(TextButton(onPressed: onUpdate, child: const Text("更新")));
    }
    return SimpleDialog(title: const Text("取引"), children: [
      SimpleDialogOption(
          child: TextFormField(
              initialValue: model.name,
              decoration: const InputDecoration(label: Text("用途")),
              onChanged: (value) => model.name = value)),
      SimpleDialogOption(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextFormField(
                    initialValue: model.cost.toString(),
                    decoration: const InputDecoration(label: Text("コスト")),
                    onChanged: (value) {
                      try {
                        model.cost = int.parse(value);
                      } catch (ex) {
                        print(ex.toString());
                      }
                    }))),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(label: Text("種別")),
                    value: model.transactionType,
                    items: TransactionType.values
                        .map((t) => DropdownMenuItem<TransactionType>(
                            value: t, child: Text(getTransactionTypeName(t))))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        model.transactionType = value;
                      }
                    })))
      ])),
      SimpleDialogOption(child: ButtonBar(children: buttons))
    ]);
  }

  @override
  CrudModel<DbTransactionData, DbTransactionCompanion> createModel(
          Notifier notifier) =>
      _TransactionModel(notifier, createRepository(), widget.data);

  @override
  RepositoryProvider<CrudRepository<DbTransactionData, DbTransactionCompanion>>
      createRepository() => transactionRepositoryProvider;

  void onCancel() {
    Navigator.pop(context);
  }

  void onCreate() {
    viewModel.create();
    Navigator.pop(context);
  }

  void onUpdate() {
    final data = widget.data;
    if (data == null) {
      return;
    }
    viewModel.update(data.id);
    Navigator.pop(context);
  }

  String getTransactionTypeName(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.expence:
        return "支出";
      case TransactionType.income:
        return "収入";
    }
  }
}

class _TransactionModel
    extends CrudModel<DbTransactionData, DbTransactionCompanion> {
  DbTransactionData? _data;
  late final Property<String> _name;
  late final Property<DateTime> _transactionDate;
  late final Property<int> _cost;
  late final Property<TransactionType> _transactionType;

  String get name => _name.value;
  set name(String value) => _name.value = value;

  DateTime get transactionDate => _transactionDate.value;
  set transactionDate(DateTime value) => _transactionDate.value = value;

  int get cost => _cost.value;
  set cost(int value) => _cost.value = value;

  TransactionType get transactionType => _transactionType.value;
  set transactionType(TransactionType value) => _transactionType.value = value;

  _TransactionModel(super.notifier, super.provider, DbTransactionData? data) {
    _name = propertyOf(data?.name ?? "");
    _cost = propertyOf(data?.cost ?? 0);
    _transactionDate = propertyOf(data?.transactionDate ?? DateTime.now());

    int transactionIntValue = data?.transactionType ?? 0;
    _transactionType = propertyOf(TransactionType.values[transactionIntValue]);

    this._data = data;
  }

  @override
  Future<DbTransactionData> create() async {
    final factory = _TransactionFactory(cost, name, transactionDate,
        transactionType, DateTime.now(), DateTime.now());
    return await repository.create(factory);
  }

  @override
  Future<DbTransactionData> update(int id) async {
    final factory = _TransactionFactory(cost, name, transactionDate,
        transactionType, _data!.createdAt, DateTime.now());
    return await repository.update(id, factory);
  }
}

class _TransactionCrudAppRepository
    extends CrudRepository<DbTransactionData, DbTransactionCompanion> {
  @override
  Future<DbTransactionData> create(
      CrudRepositoryFactory<DbTransactionCompanion> factory) async {
    return await AppDatabase().createTransaction(factory.generate());
  }

  @override
  Future<DbTransactionData> delete(
      int id, CrudRepositoryFactory<DbTransactionCompanion> factory) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<DbTransactionData>> fetch(
      CrudRepositoryFactory<DbTransactionCompanion> factory) async {
    return await AppDatabase().fetchTransactions();
  }

  @override
  Future<DbTransactionData> fetchItem(
      int id, CrudRepositoryFactory<DbTransactionCompanion> factory) async {
    return await AppDatabase().fetchTransactionItem(id);
  }

  @override
  Future<DbTransactionData> update(
      int id, CrudRepositoryFactory<DbTransactionCompanion> factory) async {
    return await AppDatabase().updateTransaction(id, factory.generate());
  }
}

class _TransactionFactory
    extends CrudRepositoryFactory<DbTransactionCompanion> {
  final int _cost;
  final String _name;
  final DateTime _transactionDate;
  final TransactionType _transactionType;
  final DateTime _createdAt;
  final DateTime _updatedAt;

  _TransactionFactory(this._cost, this._name, this._transactionDate,
      this._transactionType, this._createdAt, this._updatedAt);

  @override
  DbTransactionCompanion generate() {
    return DbTransactionCompanion(
        name: Value(_name),
        transactionDate: Value(_transactionDate),
        cost: Value(_cost),
        createdAt: Value(_createdAt),
        updatedAt: Value(_updatedAt),
        transactionType:
            Value(TransactionType.values.indexOf(_transactionType)));
  }
}
