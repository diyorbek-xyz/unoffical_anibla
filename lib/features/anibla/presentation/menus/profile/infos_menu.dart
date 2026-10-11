import 'package:application/features/anibla/data/models/main/profile.dart';
import 'package:application/features/anibla/presentation/dialogs/edit_name.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class ProfileInfosMenu extends StatelessWidget {
  final Profile profile;
  const ProfileInfosMenu(this.profile, {super.key});

  @override
  Widget build(BuildContext context) {
    final items = profile.map(
      anibla: (value) => [
        ListModel(
          label: "Ismi",
          value: value.name,
          icon: Icons.person_pin_sharp,
          actions: [IconButton(onPressed: () => showEditProfileName(context), icon: Icon(Icons.edit))],
        ),
        ListModel(
          label: "Telefon raqam",
          value: value.phoneNumber == 0 ? "Mavjud emas" : value.phoneNumber.toString(),
          icon: Icons.phone_sharp,
        ),
        ListModel(label: "Email manzil", value: value.email, icon: Icons.email_sharp),
        ListModel(
          label: "Animeshnik bolgan sanasi",
          value: "${DateTime.tryParse(value.createdAt)?.formatFull()}-yil",
          icon: Icons.date_range_sharp,
        ),
        ListModel(label: "Balans", value: "${value.balance} so'm", icon: Icons.currency_bitcoin),
        ListModel(label: "Tolov uchun id raqam", value: value.paymentId.toString(), icon: Icons.payment_sharp),
      ],
      mano: (value) => [
        ListModel(
          label: "Ismi",
          value: value.name,
          icon: Icons.person_pin_sharp,
          actions: [IconButton(onPressed: () => showEditProfileName(context), icon: Icon(Icons.edit))],
        ),
        ListModel(
          label: "Telefon raqam",
          value: value.phoneNumber.isEmpty ? "Mavjud emas" : value.phoneNumber,
          icon: Icons.phone_sharp,
        ),
        ListModel(
          label: "Otaku bo'lgan sanasi",
          value: "${DateTime.tryParse(value.createdDate)?.formatFull()}-yil",
          icon: Icons.date_range_sharp,
        ),
        ListModel(label: "Balans", value: "${value.balance} so'm", icon: Icons.currency_bitcoin),
        ListModel(label: "Tolov uchun id raqam", value: value.paymentId.toString(), icon: Icons.payment_sharp),
      ],
    );
    return ListsWidget(items: items);
  }
}
