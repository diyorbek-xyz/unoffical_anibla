import 'package:application/core/constants/theme.dart';
import 'package:application/features/profile/domain/entities/account_entity.dart';
import 'package:flutter/material.dart';

class InfosMenu extends StatefulWidget {
  final AccountEntity data;
  const InfosMenu({super.key, required this.data});

  @override
  State<InfosMenu> createState() => _InfosMenuState();
}

class _InfosMenuState extends State<InfosMenu> {
  final nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.value = TextEditingValue(text: widget.data.name);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(text: "Ismi / Familiya:"),
                TextSpan(text: widget.data.name),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(text: "Telefon raqam:"),
                TextSpan(text: widget.data.phoneNumber?.toString() ?? "Mavjud emas"),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(text: "Email manzili:"),
                TextSpan(text: widget.data.email ?? "Mavjud emas"),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16),
              children: [
                TextSpan(text: "To'lo'v uchun id raqam:"),
                TextSpan(text: widget.data.paymentIdStr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
