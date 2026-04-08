import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class SeasonEntity extends Equatable {
  final String id;
  final String slug;
  final Translated title;

  const SeasonEntity({
    required this.id,
    required this.slug,
    required this.title,
  });

  @override
  List<Object?> get props => [id, slug, title];
}
