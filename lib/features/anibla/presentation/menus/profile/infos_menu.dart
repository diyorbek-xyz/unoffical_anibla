import 'package:application/features/anibla/data/view_model/profile_view.dart';
import 'package:application/features/anibla/presentation/dialogs/edit_name.dart';
import 'package:application/shared/widgets/list.dart';
import 'package:flutter/material.dart';

class ProfileInfosMenu extends StatelessWidget {
  final ProfileView profile;
  const ProfileInfosMenu(this.profile, {super.key});

  @override
  Widget build(BuildContext context) => ListsWidget(
    items: [
      ListModel(
        label: "Ismi",
        value: profile.name,
        icon: Icons.person_pin_sharp,
        actions: [IconButton(onPressed: () => showEditProfileName(context), icon: Icon(Icons.edit))],
      ),
      ListModel(label: "Telefon raqam", value: profile.phoneNumber, icon: Icons.phone_sharp),
      ListModel(label: "Email manzil", value: profile.email, icon: Icons.email_sharp),
      ListModel(
        label: "${profile.type.isAnibla ? "Animeshnik" : "Otaku"} bo'lgan sanasi",
        value: profile.createdAt,
        icon: Icons.date_range_sharp,
      ),
      ListModel(label: "Balans", value: profile.balance, icon: Icons.currency_bitcoin),
      ListModel(label: "Tolov uchun id raqam", value: profile.paymentId.toString(), icon: Icons.payment_sharp),
    ],
  );
}
