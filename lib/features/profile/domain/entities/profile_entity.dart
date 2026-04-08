import 'package:application/features/profile/domain/entities/session_entity.dart';
import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? appleId;
  final String id;
  final DateTime createdAt;
  final String name;
  final String? email;
  final int paymentId;
  final int? phoneNumber;
  final double balance;
  final dynamic subscription;
  final String role;
  final bool activated;
  final bool createdByAdmin;
  final String? telegramToken;
  final List transactions;
  final String image;
  final DateTime updatedAt;
  final String? emailLC;
  final String? lastAnimeType;
  final String nameLC;
  final String phoneStr;
  final String paymentIdStr;
  final dynamic lastAnime;
  final String tokenId;
  final List<SessionEntity> sessions;
  final List<dynamic> savedSeries;
  final List<dynamic> savedMovies;
  final int total;

  const ProfileEntity({
    this.email,
    this.phoneNumber,
    this.subscription,
    this.appleId,
    this.emailLC,
    this.lastAnime,
    this.lastAnimeType,
    this.telegramToken,
    required this.activated,
    required this.balance,
    required this.id,
    required this.name,
    required this.role,
    required this.image,
    required this.transactions,
    required this.createdAt,
    required this.createdByAdmin,
    required this.nameLC,
    required this.paymentId,
    required this.paymentIdStr,
    required this.phoneStr,
    required this.savedMovies,
    required this.savedSeries,
    required this.sessions,
    required this.tokenId,
    required this.total,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    activated,
    balance,
    email,
    id,
    name,
    phoneNumber,
    role,
    image,
    subscription,
    transactions,
    appleId,
    createdAt,
    createdByAdmin,
    emailLC,
    lastAnime,
    lastAnimeType,
    nameLC,
    paymentId,
    paymentIdStr,
    phoneStr,
    savedMovies,
    savedSeries,
    sessions,
    telegramToken,
    tokenId,
    total,
    updatedAt,
  ];
}
