// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AppState.serializer)
      ..add(Cast.serializer)
      ..add(Movie.serializer)
      ..add(MovieList.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Movie)]),
          () => new ListBuilder<Movie>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Cast)]),
          () => new ListBuilder<Cast>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Movie)]),
          () => new ListBuilder<Movie>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Cast)]),
          () => new ListBuilder<Cast>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
