import 'package:application/features/anibla/data/enums/data_type.dart';
import 'package:application/features/anibla/data/models/main/anibla_profile.dart';
import 'package:application/features/anibla/data/models/main/mano_profile.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_view.freezed.dart';

@freezed
abstract class ProfileView with _$ProfileView {
  const factory ProfileView({
    @Default("Mavjud emas") String name,
    @Default("Mavjud emas") String email,
    @Default("Mavjud emas") String phoneNumber,
    @Default("Noma'lum") String createdAt,
    @Default("Noma'lum") String paymentId,
    @Default("0 so'm") String balance,
    @Default("") String id,
    @Default("") String role,
    @Default("") String avatar,
    @Default("") String tokenId,
    @Default(false) bool hasSubscription,
    @Default(DataType.anibla) DataType type,
  }) = _ProfileView;

  factory ProfileView.fromAnibla(AniblaProfile profile) => ProfileView(
    id: profile.id,
    name: profile.name,
    role: profile.role,
    email: profile.email.toNullable() ?? "Mavjud emas",
    type: DataType.anibla,
    avatar: profile.avatar,
    tokenId: profile.tokenId,
    balance: "${profile.balance.toStringAsFixed(1)} so'm",
    paymentId: profile.paymentId.toString(),
    hasSubscription: profile.subscription != null,
    createdAt: "${DateTime.tryParse(profile.createdAt)?.formatFull()}-yil",
    phoneNumber: profile.phoneNumber.toNullable(1)?.toString() ?? "Mavjud emas",
  );

  factory ProfileView.fromMano(ManoProfile profile) => ProfileView(
    id: profile.id,
    name: profile.name,
    role: profile.role,
    type: DataType.mano,
    avatar: profile.avatar,
    paymentId: profile.paymentId.toString(),
    balance: "${profile.balance.tryParseDouble() ?? 0.0} so'm",
    createdAt: "${DateTime.tryParse(profile.createdDate)?.formatFull()}-yil",
    phoneNumber: profile.phoneNumber.toNullable() ?? "Mavjud emas",
  );
}
