// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PageData extends DataClass implements Insertable<PageData> {
  final int id;
  final DateTime date;
  PageData({required this.id, required this.date});
  factory PageData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PageData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  PageCompanion toCompanion(bool nullToAbsent) {
    return PageCompanion(
      id: Value(id),
      date: Value(date),
    );
  }

  factory PageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PageData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  PageData copyWith({int? id, DateTime? date}) => PageData(
        id: id ?? this.id,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PageData(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PageData && other.id == this.id && other.date == this.date);
}

class PageCompanion extends UpdateCompanion<PageData> {
  final Value<int> id;
  final Value<DateTime> date;
  const PageCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
  });
  PageCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<PageData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
    });
  }

  PageCompanion copyWith({Value<int>? id, Value<DateTime>? date}) {
    return PageCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PageCompanion(')
          ..write('id: $id, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $PageTable extends Page with TableInfo<$PageTable, PageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PageTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date];
  @override
  String get aliasedName => _alias ?? 'page';
  @override
  String get actualTableName => 'page';
  @override
  VerificationContext validateIntegrity(Insertable<PageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PageData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PageTable createAlias(String alias) {
    return $PageTable(attachedDatabase, alias);
  }
}

abstract class _$PageDatabase extends GeneratedDatabase {
  _$PageDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PageTable page = $PageTable(this);
  late final PageDao pageDao = PageDao(this as PageDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [page];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PageDaoMixin on DatabaseAccessor<PageDatabase> {
  $PageTable get page => attachedDatabase.page;
}
