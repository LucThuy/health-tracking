// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PlanData extends DataClass implements Insertable<PlanData> {
  final int id;
  final String? content;
  final DateTime date;
  PlanData({required this.id, this.content, required this.date});
  factory PlanData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlanData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String?>(content);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  PlanCompanion toCompanion(bool nullToAbsent) {
    return PlanCompanion(
      id: Value(id),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      date: Value(date),
    );
  }

  factory PlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String?>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String?>(content),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  PlanData copyWith({int? id, String? content, DateTime? date}) => PlanData(
        id: id ?? this.id,
        content: content ?? this.content,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PlanData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanData &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date);
}

class PlanCompanion extends UpdateCompanion<PlanData> {
  final Value<int> id;
  final Value<String?> content;
  final Value<DateTime> date;
  const PlanCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
  });
  PlanCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<PlanData> custom({
    Expression<int>? id,
    Expression<String?>? content,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
    });
  }

  PlanCompanion copyWith(
      {Value<int>? id, Value<String?>? content, Value<DateTime>? date}) {
    return PlanCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String?>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $PlanTable extends Plan with TableInfo<$PlanTable, PlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, content, date];
  @override
  String get aliasedName => _alias ?? 'plan';
  @override
  String get actualTableName => 'plan';
  @override
  VerificationContext validateIntegrity(Insertable<PlanData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlanData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlanTable createAlias(String alias) {
    return $PlanTable(attachedDatabase, alias);
  }
}

abstract class _$PlanDatabase extends GeneratedDatabase {
  _$PlanDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PlanTable plan = $PlanTable(this);
  late final PlanDao planDao = PlanDao(this as PlanDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [plan];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PlanDaoMixin on DatabaseAccessor<PlanDatabase> {
  $PlanTable get plan => attachedDatabase.plan;
}
