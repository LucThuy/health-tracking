// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PlanData extends DataClass implements Insertable<PlanData> {
  final int id;
  final String? contentMorning;
  final String? contentLunch;
  final String? contentDinner;
  final DateTime date;
  PlanData({required this.id, this.contentMorning, this.contentLunch, this.contentDinner, required this.date});
  factory PlanData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlanData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      contentMorning: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contentMorning']),
      contentLunch: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contentLunch']),
      contentDinner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}contentDinner']),
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || contentMorning != null) {
      map['contentMorning'] = Variable<String?>(contentMorning);
    }
    if (!nullToAbsent || contentLunch != null) {
      map['contentLunch'] = Variable<String?>(contentLunch);
    }
    if (!nullToAbsent || contentDinner != null) {
      map['contentDinner'] = Variable<String?>(contentDinner);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  PlanCompanion toCompanion(bool nullToAbsent) {
    return PlanCompanion(
      id: Value(id),
      contentMorning: contentMorning == null && nullToAbsent
          ? const Value.absent()
          : Value(contentMorning),
      contentLunch: contentLunch == null && nullToAbsent
          ? const Value.absent()
          : Value(contentLunch),
      contentDinner: contentDinner == null && nullToAbsent
          ? const Value.absent()
          : Value(contentDinner),
      date: Value(date),
    );
  }

  factory PlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlanData(
      id: serializer.fromJson<int>(json['id']),
      contentMorning: serializer.fromJson<String?>(json['contentMorning']),
      contentLunch: serializer.fromJson<String?>(json['contentLunch']),
      contentDinner: serializer.fromJson<String?>(json['contentDinner']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contentMorning': serializer.toJson<String?>(contentMorning),
      'contentLunch': serializer.toJson<String?>(contentLunch),
      'contentDinner': serializer.toJson<String?>(contentDinner),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  PlanData copyWith({int? id, String? content, DateTime? date}) => PlanData(
        id: id ?? this.id,
        contentMorning: content ?? this.contentMorning,
        contentLunch: content ?? this.contentLunch,
        contentDinner: content ?? this.contentDinner,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PlanData(')
          ..write('id: $id, ')
          ..write('contentMorning: $contentMorning, ')
          ..write('contentLunch: $contentLunch, ')
          ..write('contentDinner: $contentDinner, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, contentMorning, contentLunch, contentDinner, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanData &&
          other.id == this.id &&
          other.contentMorning == this.contentMorning &&
          other.contentLunch == this.contentLunch &&
          other.contentDinner == this.contentDinner &&
          other.date == this.date);
}

class PlanCompanion extends UpdateCompanion<PlanData> {
  final Value<int> id;
  final Value<String?> contentMorning;
  final Value<String?> contentLunch;
  final Value<String?> contentDinner;
  final Value<DateTime> date;
  const PlanCompanion({
    this.id = const Value.absent(),
    this.contentMorning = const Value.absent(),
    this.contentLunch = const Value.absent(),
    this.contentDinner = const Value.absent(),
    this.date = const Value.absent(),
  });
  PlanCompanion.insert({
    this.id = const Value.absent(),
    this.contentMorning = const Value.absent(),
    this.contentLunch = const Value.absent(),
    this.contentDinner = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<PlanData> custom({
    Expression<int>? id,
    Expression<String?>? contentMorning,
    Expression<String?>? contentLunch,
    Expression<String?>? contentDinner,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contentMorning != null) 'contentMorning': contentMorning,
      if (contentLunch != null) 'contentLunch': contentLunch,
      if (contentDinner != null) 'contentDinner': contentDinner,
      if (date != null) 'date': date,
    });
  }

  PlanCompanion copyWith(
      {Value<int>? id, Value<String?>? contentMorning, Value<String?>? contentLunch,Value<String?>? contentDinner, Value<DateTime>? date}) {
    return PlanCompanion(
      id: id ?? this.id,
      contentMorning: contentMorning ?? this.contentMorning,
      contentLunch: contentLunch ?? this.contentLunch,
      contentDinner: contentDinner ?? this.contentDinner,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contentMorning.present) {
      map['contentMorning'] = Variable<String?>(contentMorning.value);
    }
    if (contentLunch.present) {
      map['contentLunch'] = Variable<String?>(contentLunch.value);
    }
    if (contentDinner.present) {
      map['contentDinner'] = Variable<String?>(contentDinner.value);
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
          ..write('contentMorning: $contentMorning, ')
          ..write('contentLunch: $contentLunch, ')
          ..write('contentDinner: $contentDinner, ')
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
  final VerificationMeta _contentMorningMeta = const VerificationMeta('contentMorning');
  @override
  late final GeneratedColumn<String?> contentMorning = GeneratedColumn<String?>(
      'contentMorning', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _contentLunchMeta = const VerificationMeta('contentLunch');
  @override
  late final GeneratedColumn<String?> contentLunch = GeneratedColumn<String?>(
      'contentLunch', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _contentDinnerMeta = const VerificationMeta('contentDinner');
  @override
  late final GeneratedColumn<String?> contentDinner = GeneratedColumn<String?>(
      'contentDinner', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, contentMorning, contentLunch, contentDinner, date];
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
    if (data.containsKey('contentMorning')) {
      context.handle(_contentMorningMeta,
          contentMorning.isAcceptableOrUnknown(data['contentMorning']!, _contentMorningMeta));
    }
    if (data.containsKey('contentLunch')) {
      context.handle(_contentLunchMeta,
          contentLunch.isAcceptableOrUnknown(data['contentLunch']!, _contentLunchMeta));
    }
    if (data.containsKey('contentDinner')) {
      context.handle(_contentDinnerMeta,
          contentDinner.isAcceptableOrUnknown(data['contentDinner']!, _contentDinnerMeta));
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
