import 'package:freezed_annotation/freezed_annotation.dart';

part 'base.freezed.dart';
part 'base.g.dart';

@freezed
class Base with _$Base {
  const factory Base({required String message, required bool error}) = _Base;

  factory Base.fromJson(json) => _$BaseFromJson(json);
}
