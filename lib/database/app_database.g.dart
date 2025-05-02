// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DbTransactionTable extends DbTransaction
    with TableInfo<$DbTransactionTable, DbTransactionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbTransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedColumn<int> transactionType = GeneratedColumn<int>(
      'transaction_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
      'cost', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, transactionDate, transactionType, name, cost];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_transaction';
  @override
  VerificationContext validateIntegrity(Insertable<DbTransactionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
          _transactionTypeMeta,
          transactionType.isAcceptableOrUnknown(
              data['transaction_type']!, _transactionTypeMeta));
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbTransactionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbTransactionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      transactionType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_type'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost'])!,
    );
  }

  @override
  $DbTransactionTable createAlias(String alias) {
    return $DbTransactionTable(attachedDatabase, alias);
  }
}

class DbTransactionData extends DataClass
    implements Insertable<DbTransactionData> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime transactionDate;
  final int transactionType;
  final String name;
  final int cost;
  const DbTransactionData(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.transactionDate,
      required this.transactionType,
      required this.name,
      required this.cost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['transaction_type'] = Variable<int>(transactionType);
    map['name'] = Variable<String>(name);
    map['cost'] = Variable<int>(cost);
    return map;
  }

  DbTransactionCompanion toCompanion(bool nullToAbsent) {
    return DbTransactionCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      transactionDate: Value(transactionDate),
      transactionType: Value(transactionType),
      name: Value(name),
      cost: Value(cost),
    );
  }

  factory DbTransactionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbTransactionData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      transactionType: serializer.fromJson<int>(json['transactionType']),
      name: serializer.fromJson<String>(json['name']),
      cost: serializer.fromJson<int>(json['cost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'transactionType': serializer.toJson<int>(transactionType),
      'name': serializer.toJson<String>(name),
      'cost': serializer.toJson<int>(cost),
    };
  }

  DbTransactionData copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? transactionDate,
          int? transactionType,
          String? name,
          int? cost}) =>
      DbTransactionData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        transactionDate: transactionDate ?? this.transactionDate,
        transactionType: transactionType ?? this.transactionType,
        name: name ?? this.name,
        cost: cost ?? this.cost,
      );
  DbTransactionData copyWithCompanion(DbTransactionCompanion data) {
    return DbTransactionData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      name: data.name.present ? data.name.value : this.name,
      cost: data.cost.present ? data.cost.value : this.cost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbTransactionData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionType: $transactionType, ')
          ..write('name: $name, ')
          ..write('cost: $cost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, createdAt, updatedAt, transactionDate, transactionType, name, cost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbTransactionData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.transactionDate == this.transactionDate &&
          other.transactionType == this.transactionType &&
          other.name == this.name &&
          other.cost == this.cost);
}

class DbTransactionCompanion extends UpdateCompanion<DbTransactionData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> transactionDate;
  final Value<int> transactionType;
  final Value<String> name;
  final Value<int> cost;
  const DbTransactionCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.name = const Value.absent(),
    this.cost = const Value.absent(),
  });
  DbTransactionCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime transactionDate,
    required int transactionType,
    required String name,
    required int cost,
  })  : createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        transactionDate = Value(transactionDate),
        transactionType = Value(transactionType),
        name = Value(name),
        cost = Value(cost);
  static Insertable<DbTransactionData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? transactionDate,
    Expression<int>? transactionType,
    Expression<String>? name,
    Expression<int>? cost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (transactionType != null) 'transaction_type': transactionType,
      if (name != null) 'name': name,
      if (cost != null) 'cost': cost,
    });
  }

  DbTransactionCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime>? transactionDate,
      Value<int>? transactionType,
      Value<String>? name,
      Value<int>? cost}) {
    return DbTransactionCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      transactionDate: transactionDate ?? this.transactionDate,
      transactionType: transactionType ?? this.transactionType,
      name: name ?? this.name,
      cost: cost ?? this.cost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<int>(transactionType.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbTransactionCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionType: $transactionType, ')
          ..write('name: $name, ')
          ..write('cost: $cost')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DbTransactionTable dbTransaction = $DbTransactionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbTransaction];
}

typedef $$DbTransactionTableCreateCompanionBuilder = DbTransactionCompanion
    Function({
  Value<int> id,
  required DateTime createdAt,
  required DateTime updatedAt,
  required DateTime transactionDate,
  required int transactionType,
  required String name,
  required int cost,
});
typedef $$DbTransactionTableUpdateCompanionBuilder = DbTransactionCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime> transactionDate,
  Value<int> transactionType,
  Value<String> name,
  Value<int> cost,
});

class $$DbTransactionTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DbTransactionTable,
    DbTransactionData,
    $$DbTransactionTableFilterComposer,
    $$DbTransactionTableOrderingComposer,
    $$DbTransactionTableCreateCompanionBuilder,
    $$DbTransactionTableUpdateCompanionBuilder> {
  $$DbTransactionTableTableManager(_$AppDatabase db, $DbTransactionTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DbTransactionTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DbTransactionTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<int> transactionType = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> cost = const Value.absent(),
          }) =>
              DbTransactionCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            transactionDate: transactionDate,
            transactionType: transactionType,
            name: name,
            cost: cost,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            required DateTime transactionDate,
            required int transactionType,
            required String name,
            required int cost,
          }) =>
              DbTransactionCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            transactionDate: transactionDate,
            transactionType: transactionType,
            name: name,
            cost: cost,
          ),
        ));
}

class $$DbTransactionTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DbTransactionTable> {
  $$DbTransactionTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get transactionDate => $state.composableBuilder(
      column: $state.table.transactionDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get transactionType => $state.composableBuilder(
      column: $state.table.transactionType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get cost => $state.composableBuilder(
      column: $state.table.cost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DbTransactionTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DbTransactionTable> {
  $$DbTransactionTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get transactionDate => $state.composableBuilder(
      column: $state.table.transactionDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get transactionType => $state.composableBuilder(
      column: $state.table.transactionType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get cost => $state.composableBuilder(
      column: $state.table.cost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DbTransactionTableTableManager get dbTransaction =>
      $$DbTransactionTableTableManager(_db, _db.dbTransaction);
}
