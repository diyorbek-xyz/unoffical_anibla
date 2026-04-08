import 'package:application/features/common/domain/entities/translated_entity.dart';
import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final String id;
  final Translated title;
  final String slug;
  final bool status;
  const GenreEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.status,
  });

  @override
  List<Object?> get props => [id, slug, title, status];
}
