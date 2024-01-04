// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LineData extends DataClass implements Insertable<LineData> {
  final int id;
  final int pageId;
  final DateTime date;
  final String imagePath;
  final String name;
  LineData(
      {required this.id,
      required this.pageId,
      required this.date,
      required this.imagePath,
      required this.name});
  factory LineData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LineData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      pageId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page_id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      imagePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_path'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['page_id'] = Variable<int>(pageId);
    map['date'] = Variable<DateTime>(date);
    map['image_path'] = Variable<String>(imagePath);
    map['name'] = Variable<String>(name);
    return map;
  }

  LineCompanion toCompanion(bool nullToAbsent) {
    return LineCompanion(
      id: Value(id),
      pageId: Value(pageId),
      date: Value(date),
      imagePath: Value(imagePath),
      name: Value(name),
    );
  }

  factory LineData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LineData(
      id: serializer.fromJson<int>(json['id']),
      pageId: serializer.fromJson<int>(json['pageId']),
      date: serializer.fromJson<DateTime>(json['date']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pageId': serializer.toJson<int>(pageId),
      'date': serializer.toJson<DateTime>(date),
      'imagePath': serializer.toJson<String>(imagePath),
      'name': serializer.toJson<String>(name),
    };
  }

  LineData copyWith(
          {int? id,
          int? pageId,
          DateTime? date,
          String? imagePath,
          String? name}) =>
      LineData(
        id: id ?? this.id,
        pageId: pageId ?? this.pageId,
        date: date ?? this.date,
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('LineData(')
          ..write('id: $id, ')
          ..write('pageId: $pageId, ')
          ..write('date: $date, ')
          ..write('imagePath: $imagePath, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pageId, date, imagePath, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LineData &&
          other.id == this.id &&
          other.pageId == this.pageId &&
          other.date == this.date &&
          other.imagePath == this.imagePath &&
          other.name == this.name);
}

class LineCompanion extends UpdateCompanion<LineData> {
  final Value<int> id;
  final Value<int> pageId;
  final Value<DateTime> date;
  final Value<String> imagePath;
  final Value<String> name;
  const LineCompanion({
    this.id = const Value.absent(),
    this.pageId = const Value.absent(),
    this.date = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.name = const Value.absent(),
  });
  LineCompanion.insert({
    this.id = const Value.absent(),
    required int pageId,
    required DateTime date,
    required String imagePath,
    required String name,
  })  : pageId = Value(pageId),
        date = Value(date),
        imagePath = Value(imagePath),
        name = Value(name);
  static Insertable<LineData> custom({
    Expression<int>? id,
    Expression<int>? pageId,
    Expression<DateTime>? date,
    Expression<String>? imagePath,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pageId != null) 'page_id': pageId,
      if (date != null) 'date': date,
      if (imagePath != null) 'image_path': imagePath,
      if (name != null) 'name': name,
    });
  }

  LineCompanion copyWith(
      {Value<int>? id,
      Value<int>? pageId,
      Value<DateTime>? date,
      Value<String>? imagePath,
      Value<String>? name}) {
    return LineCompanion(
      id: id ?? this.id,
      pageId: pageId ?? this.pageId,
      date: date ?? this.date,
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pageId.present) {
      map['page_id'] = Variable<int>(pageId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LineCompanion(')
          ..write('id: $id, ')
          ..write('pageId: $pageId, ')
          ..write('date: $date, ')
          ..write('imagePath: $imagePath, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $LineTable extends Line with TableInfo<$LineTable, LineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LineTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _pageIdMeta = const VerificationMeta('pageId');
  @override
  late final GeneratedColumn<int?> pageId = GeneratedColumn<int?>(
      'page_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _imagePathMeta = const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String?> imagePath = GeneratedColumn<String?>(
      'image_path', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pageId, date, imagePath, name];
  @override
  String get aliasedName => _alias ?? 'line';
  @override
  String get actualTableName => 'line';
  @override
  VerificationContext validateIntegrity(Insertable<LineData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('page_id')) {
      context.handle(_pageIdMeta,
          pageId.isAcceptableOrUnknown(data['page_id']!, _pageIdMeta));
    } else if (isInserting) {
      context.missing(_pageIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LineData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LineTable createAlias(String alias) {
    return $LineTable(attachedDatabase, alias);
  }
}

abstract class _$LineDatabase extends GeneratedDatabase {
  _$LineDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LineTable line = $LineTable(this);
  late final LineDao lineDao = LineDao(this as LineDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [line];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$LineDaoMixin on DatabaseAccessor<LineDatabase> {
  $LineTable get line => attachedDatabase.line;
}
