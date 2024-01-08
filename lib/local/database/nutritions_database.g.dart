// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritions_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NutritionData extends DataClass implements Insertable<NutritionData> {
  final String id;
  final String name;
  final String foodType;
  final double? calories;
  final double? protein;
  final double? carbohydrates;
  final double? fat;
  final String imagePath;
  NutritionData(
      {required this.id,
      required this.name,
      required this.foodType,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.fat,
      required this.imagePath});
  factory NutritionData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NutritionData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      foodType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}food_type'])!,
      calories: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}calories']),
      protein: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}protein']),
      carbohydrates: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carbohydrates']),
      fat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fat']),
      imagePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['food_type'] = Variable<String>(foodType);
    if (!nullToAbsent || calories != null) {
      map['calories'] = Variable<double?>(calories);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double?>(protein);
    }
    if (!nullToAbsent || carbohydrates != null) {
      map['carbohydrates'] = Variable<double?>(carbohydrates);
    }
    if (!nullToAbsent || fat != null) {
      map['fat'] = Variable<double?>(fat);
    }
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  NutritionCompanion toCompanion(bool nullToAbsent) {
    return NutritionCompanion(
      id: Value(id),
      name: Value(name),
      foodType: Value(foodType),
      calories: calories == null && nullToAbsent
          ? const Value.absent()
          : Value(calories),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      carbohydrates: carbohydrates == null && nullToAbsent
          ? const Value.absent()
          : Value(carbohydrates),
      fat: fat == null && nullToAbsent ? const Value.absent() : Value(fat),
      imagePath: Value(imagePath),
    );
  }

  factory NutritionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NutritionData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      foodType: serializer.fromJson<String>(json['foodType']),
      calories: serializer.fromJson<double?>(json['calories']),
      protein: serializer.fromJson<double?>(json['protein']),
      carbohydrates: serializer.fromJson<double?>(json['carbohydrates']),
      fat: serializer.fromJson<double?>(json['fat']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'foodType': serializer.toJson<String>(foodType),
      'calories': serializer.toJson<double?>(calories),
      'protein': serializer.toJson<double?>(protein),
      'carbohydrates': serializer.toJson<double?>(carbohydrates),
      'fat': serializer.toJson<double?>(fat),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  NutritionData copyWith(
          {String? id,
          String? name,
          String? foodType,
          double? calories,
          double? protein,
          double? carbohydrates,
          double? fat,
          String? imagePath}) =>
      NutritionData(
        id: id ?? this.id,
        name: name ?? this.name,
        foodType: foodType ?? this.foodType,
        calories: calories ?? this.calories,
        protein: protein ?? this.protein,
        carbohydrates: carbohydrates ?? this.carbohydrates,
        fat: fat ?? this.fat,
        imagePath: imagePath ?? this.imagePath,
      );
  @override
  String toString() {
    return (StringBuffer('NutritionData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('foodType: $foodType, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, foodType, calories, protein, carbohydrates, fat, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NutritionData &&
          other.id == this.id &&
          other.name == this.name &&
          other.foodType == this.foodType &&
          other.calories == this.calories &&
          other.protein == this.protein &&
          other.carbohydrates == this.carbohydrates &&
          other.fat == this.fat &&
          other.imagePath == this.imagePath);
}

class NutritionCompanion extends UpdateCompanion<NutritionData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> foodType;
  final Value<double?> calories;
  final Value<double?> protein;
  final Value<double?> carbohydrates;
  final Value<double?> fat;
  final Value<String> imagePath;
  const NutritionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.foodType = const Value.absent(),
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fat = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  NutritionCompanion.insert({
    required String id,
    required String name,
    required String foodType,
    this.calories = const Value.absent(),
    this.protein = const Value.absent(),
    this.carbohydrates = const Value.absent(),
    this.fat = const Value.absent(),
    required String imagePath,
  })  : id = Value(id),
        name = Value(name),
        foodType = Value(foodType),
        imagePath = Value(imagePath);
  static Insertable<NutritionData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? foodType,
    Expression<double?>? calories,
    Expression<double?>? protein,
    Expression<double?>? carbohydrates,
    Expression<double?>? fat,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (foodType != null) 'food_type': foodType,
      if (calories != null) 'calories': calories,
      if (protein != null) 'protein': protein,
      if (carbohydrates != null) 'carbohydrates': carbohydrates,
      if (fat != null) 'fat': fat,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  NutritionCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? foodType,
      Value<double?>? calories,
      Value<double?>? protein,
      Value<double?>? carbohydrates,
      Value<double?>? fat,
      Value<String>? imagePath}) {
    return NutritionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      foodType: foodType ?? this.foodType,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fat: fat ?? this.fat,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (foodType.present) {
      map['food_type'] = Variable<String>(foodType.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double?>(calories.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double?>(protein.value);
    }
    if (carbohydrates.present) {
      map['carbohydrates'] = Variable<double?>(carbohydrates.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double?>(fat.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NutritionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('foodType: $foodType, ')
          ..write('calories: $calories, ')
          ..write('protein: $protein, ')
          ..write('carbohydrates: $carbohydrates, ')
          ..write('fat: $fat, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $NutritionTable extends Nutrition
    with TableInfo<$NutritionTable, NutritionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NutritionTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _foodTypeMeta = const VerificationMeta('foodType');
  @override
  late final GeneratedColumn<String?> foodType = GeneratedColumn<String?>(
      'food_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _caloriesMeta = const VerificationMeta('calories');
  @override
  late final GeneratedColumn<double?> calories = GeneratedColumn<double?>(
      'calories', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _proteinMeta = const VerificationMeta('protein');
  @override
  late final GeneratedColumn<double?> protein = GeneratedColumn<double?>(
      'protein', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _carbohydratesMeta =
      const VerificationMeta('carbohydrates');
  @override
  late final GeneratedColumn<double?> carbohydrates = GeneratedColumn<double?>(
      'carbohydrates', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double?> fat = GeneratedColumn<double?>(
      'fat', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String?> imagePath = GeneratedColumn<String?>(
      'image_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, foodType, calories, protein, carbohydrates, fat, imagePath];
  @override
  String get aliasedName => _alias ?? 'nutrition';
  @override
  String get actualTableName => 'nutrition';
  @override
  VerificationContext validateIntegrity(Insertable<NutritionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('food_type')) {
      context.handle(_foodTypeMeta,
          foodType.isAcceptableOrUnknown(data['food_type']!, _foodTypeMeta));
    } else if (isInserting) {
      context.missing(_foodTypeMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(_caloriesMeta,
          calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta));
    }
    if (data.containsKey('protein')) {
      context.handle(_proteinMeta,
          protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta));
    }
    if (data.containsKey('carbohydrates')) {
      context.handle(
          _carbohydratesMeta,
          carbohydrates.isAcceptableOrUnknown(
              data['carbohydrates']!, _carbohydratesMeta));
    }
    if (data.containsKey('fat')) {
      context.handle(
          _fatMeta, fat.isAcceptableOrUnknown(data['fat']!, _fatMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NutritionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NutritionData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NutritionTable createAlias(String alias) {
    return $NutritionTable(attachedDatabase, alias);
  }
}

abstract class _$NutritionsDatabase extends GeneratedDatabase {
  _$NutritionsDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $NutritionTable nutrition = $NutritionTable(this);
  late final NutritionsDao nutritionsDao =
      NutritionsDao(this as NutritionsDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [nutrition];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NutritionsDaoMixin on DatabaseAccessor<NutritionsDatabase> {
  $NutritionTable get nutrition => attachedDatabase.nutrition;
}
