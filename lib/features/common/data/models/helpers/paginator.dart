import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginator.freezed.dart';
part 'paginator.g.dart';

@Freezed(toJson: true)
sealed class Paginator with _$Paginator {
  factory Paginator({required final int limit, required final int page}) = _Paginator;
}
