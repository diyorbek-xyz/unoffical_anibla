import 'package:application/core/utils/extensions.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter/material.dart';

class ProfileInfosMenu extends StatefulWidget {
  final ProfileEntity data;
  const ProfileInfosMenu({super.key, required this.data});

  @override
  State<ProfileInfosMenu> createState() => _ProfileInfosMenuState();
}

class _ProfileInfosMenuState extends State<ProfileInfosMenu> {
  @override
  Widget build(BuildContext context) {
    final items = [
      ListModel(
        label: "Ismi",
        value: widget.data.name,
        icon: Icons.person_pin_sharp,
      ),
      ListModel(
        label: "Telefon raqam",
        value: widget.data.phoneNumber == 0
            ? "Mavjud emas"
            : widget.data.phoneNumber.toString(),
        icon: Icons.phone_sharp,
      ),
      ListModel(
        label: "Email manzil",
        value: widget.data.email,
        icon: Icons.email_sharp,
      ),
      ListModel(
        label: "Animeshnik bolgan sanasi",
        value: "${widget.data.createdAt.formatFull()}-yil",
        icon: Icons.date_range_sharp,
      ),
      ListModel(
        label: "Balans",
        value: "${widget.data.balance} so'm",
        icon: Icons.currency_bitcoin,
      ),
      ListModel(
        label: "Tolov uchun id raqam",
        value: widget.data.paymentId.toString(),
        icon: Icons.payment_sharp,
      ),
    ];

    return ListsWidget(items: items);
  }
}
