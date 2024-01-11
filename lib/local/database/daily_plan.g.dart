// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_plan.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DailyPlanData extends DataClass implements Insertable<DailyPlanData> {
  final int id;
  final DateTime date;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  DailyPlanData(
      {required this.id,
      required this.date,
      required this.calories,
      required this.protein,
      required this.carbohydrates,
      required this.fat});
  factory DailyPlanData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DailyPlanData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      calories: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calories'])!,
      protein: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}protein'])!,
      carbohydrates: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carbohydrates'])!,
      fat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fat'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['calories'] = Variable<double>(calories);
    map['protein'] = Variable<double>(protein);
    map['carbohydrates'] = Variable<double>(carbohydrates);
    map['fat'] = Variable<double>(fat);
    return map;
  }

  DailyPlanCompanion toCompanion(bool nullToAbsent) {
    return DailyPlanCompanion(
      id: Value(id),
      date: Value(date),
      calories: Value(calories),
      protein: Value(protein),
      carbohydrates: Value(carbohydrates),
      fat: Value(fat),
    );
  }

  factory DailyPlanData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DailyPlanData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      calories: serializer.fromJson<double>(json['calories']),
      protein: serializer.fromJson<double>(json['protein']),
      carbohydrates: serializer.fromJson<double>(json['carbohydrates']),
      fat: serializer.fromJson<double>(json['fat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'calories': serializer.toJson<double>(calories),
      'protein': serializer.toJson<double>(protein),
      'carbohydrates': serializer.toJson<double>(carbohydrates),
      'fat': serializer.toJson<double>(fat),
    };
  }

  DailyPlanData copyWith(
          {int? id,
          DateTime? date,
          double? calories,
          double? protein,
          double? carbohydrates,
          double? fat}) =>
      DailyPlanData(
        id: id ?? this.id,
        date: date ?? this.date,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fat: fat ?? this.fat,
      );
  @override
  String toString() {
    return (StringBuffer('DailyPlanData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, calories, protein, carbohydrates, fat);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyPlanData &&
          other.id == this.id &&
          other.date == this.date &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbohydrates == this.carbohydrates &&
          other.fat == this.fat);
}

class DailyPlanCompanion extends UpdateCompanion<DailyPlanData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> calories;
  final Value<double> protein;
  final Value<double> carbohydrates;
  final Value<double> fat;
  const DailyPlanCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fat = const Value.absent(),
  });
  DailyPlanCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required double calories,
    required double protein,
    required double carbohydrates,
    required double fat,
  })  : date = Value(date),
        calories = Value(calories),
        protein = Value(protein),
        carbohydrates = Value(carbohydrates),
        fat = Value(fat);
  static Insertable<DailyPlanData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? calories,
    Expression<double>? protein,
    Expression<double>? carbohydrates,
    Expression<double>? fat,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (fat != null) 'fat': fat,
    });
  }

  DailyPlanCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<double>? calories,
      Value<double>? protein,
      Value<double>? carbohydrates,
      Value<double>? fat}) {
    return DailyPlanCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fat: fat ?? this.fat,
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
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<double>(carbohydrates.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyPlanCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat')
          ..write(')'))
        .toString();
  }
}

class $DailyPlanTable extends DailyPlan
    with TableInfo<$DailyPlanTable, DailyPlanData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyPlanTable(this.attachedDatabase, [this._alias]);
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
  final VerificationMeta _caloriesMeta = const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double?> calories = GeneratedColumn<double?>(
      'calories', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _proteinMeta = const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double?> protein = GeneratedColumn<double?>(
      'protein', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  @override
  late final GeneratedColumn<double?> carbohydrates = GeneratedColumn<double?>(
      'carbohydrates', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double?> fat = GeneratedColumn<double?>(
      'fat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, calories, protein, carbohydrates, fat];
  @override
  String get aliasedName => _alias ?? 'daily_plan';
  @override
  String get actualTableName => 'daily_plan';
  @override
  VerificationContext validateIntegrity(Insertable<DailyPlanData> instance,
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
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    } else if (isInserting) {
      context.missing(_proteinMeta);
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates']!, _carbohydratesMeta));
    } else if (isInserting) {
      context.missing(_carbohydratesMeta);
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    } else if (isInserting) {
      context.missing(_fatMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyPlanData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DailyPlanData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DailyPlanTable createAlias(String alias) {
    return $DailyPlanTable(attachedDatabase, alias);
  }
}

abstract class _$DailyPlanDatabase extends GeneratedDatabase {
  _$DailyPlanDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $DailyPlanTable dailyPlan = $DailyPlanTable(this);
  late final DailyPlanDao dailyPlanDao =
      DailyPlanDao(this as DailyPlanDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dailyPlan];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DailyPlanDaoMixin on DatabaseAccessor<DailyPlanDatabase> {
  $DailyPlanTable get dailyPlan => attachedDatabase.dailyPlan;
}
