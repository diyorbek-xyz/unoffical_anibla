import 'package:application/features/animes/data/mapper/anime_mapper.dart';
import 'package:application/features/profile/data/mapper/privacy_mapper.dart';
import 'package:application/features/profile/data/mapper/session_mapper.dart';
import 'package:application/features/profile/data/models/profile/profile_model.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';

class ProfileMapper {
  static ProfileEntity modelToEntity(ProfileModel? model) => ProfileEntity(
    privacySettings: PrivacyMapper.modelToEntity(model?.privacySettings),
    appleId: model?.appleId ?? "",
    email: model?.email ?? "Mavjud emas",
    emailLC: model?.emailLC ?? "Mavjud emas",
    lastAnime: AnimeMapper.modelToEntity(model?.lastAnime),
    lastAnimeType: model?.lastAnimeType ?? "",
    phoneNumber: model?.phoneNumber ?? 0,
    subscription: model?.subscription,
    telegramToken: model?.telegramToken ?? "",
    activated: model?.activated ?? false,
    balance: model?.balance ?? 0,
    id: model?.id ?? "",
    name: model?.name ?? "",
    role: model?.role ?? "USER",
    image: model?.image ?? "",
    transactions: model?.transactions ?? [],
    createdAt: model?.createdAt ?? DateTime(2026),
    createdByAdmin: model?.createdByAdmin ?? false,
    nameLC: model?.nameLC ?? "",
    paymentId: model?.paymentId ?? 0,
    paymentIdStr: model?.paymentIdStr ?? "",
    phoneStr: model?.phoneStr ?? "",
    savedMovies: model?.savedMovies ?? [],
    savedSeries: model?.savedSeries ?? [],
    sessions: model?.sessions?.map(SessionMapper.modelToEntity).toList() ?? [],
    tokenId: model?.tokenId ?? "",
    total: model?.total ?? 0,
    updatedAt: model?.updatedAt ?? DateTime(2026),
  );
}
