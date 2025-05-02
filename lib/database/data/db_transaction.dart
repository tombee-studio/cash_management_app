import 'package:drift/drift.dart';

class DbTransaction extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get transactionDate => dateTime()();
  IntColumn get transactionType => integer()();
  TextColumn get name => text()();
  IntColumn get cost => integer()();
}
