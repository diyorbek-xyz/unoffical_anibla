import 'package:equatable/equatable.dart';

class PrivacyEntity extends Equatable {
  final bool showComments;
  final bool showFavorites;
  final String id;
  const PrivacyEntity({required this.id, required this.showComments, required this.showFavorites});

  @override
  List<Object?> get props => [showComments, showFavorites, id];
}
