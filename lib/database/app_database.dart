import 'dart:io';

import 'package:cash_management_app/database/data/db_transaction.dart';
import 'package:drift/drift.dart';
import 'package:flutter_viewmodel/bases/provider.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

final databaseProvider = Provider<QueryExecutor>(_openConnection);

@DriftDatabase(tables: [DbTransaction])
class AppDatabase extends _$AppDatabase {
  AppDatabase._(QueryExecutor e) : super(e);

  static final AppDatabase _instance = AppDatabase._(databaseProvider.instance);

  factory AppDatabase() => _instance;

  @override
  int get schemaVersion => 1;

  Future<List<DbTransactionData>> fetchTransactions() async {
    final now = DateTime.now();
    final startDateTime = DateTime(now.year, now.month, 1);
    final endDateTime = DateTime(now.year, now.month + 1, 1);
    return await (select(dbTransaction)
          ..where((tbl) =>
              tbl.transactionDate.isBetweenValues(startDateTime, endDateTime)))
        .get();
  }

  Future<DbTransactionData> fetchTransactionItem(int id) async {
    return await (select(dbTransaction)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<DbTransactionData> createTransaction(
      DbTransactionCompanion entity) async {
    final int id = await into(dbTransaction).insert(entity);
    return await fetchTransactionItem(id);
  }

  Future<DbTransactionData> updateTransaction(
      int id, DbTransactionCompanion entity) async {
    final int updatedId = await (update(dbTransaction)
          ..where((tbl) => tbl.id.equals(id)))
        .write(entity);
    return await fetchTransactionItem(updatedId);
  }

  Future deleteTransaction(int id) async {
    await (delete(dbTransaction)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
