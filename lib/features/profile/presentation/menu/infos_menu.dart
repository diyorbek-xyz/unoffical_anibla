import 'package:application/core/utils/extensions.dart';
import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/presentation/controller/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProfileInfosMenu extends StatelessWidget {
  const ProfileInfosMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = sl<ProfileController>();
    return SignalBuilder(
      builder: (context) {
        final state = profileController.profileSignal.value;
        final data = state.value ?? profileController.fakeProfile;
        final items = [
          ListModel(label: "Ismi", value: data.name, icon: Icons.person_pin_sharp),
          ListModel(label: "Telefon raqam", value: data.phoneNumber == 0 ? "Mavjud emas" : data.phoneNumber.toString(), icon: Icons.phone_sharp),
          ListModel(label: "Email manzil", value: data.email, icon: Icons.email_sharp),
          ListModel(label: "Animeshnik bolgan sanasi", value: "${data.createdAt.formatFull()}-yil", icon: Icons.date_range_sharp),
          ListModel(label: "Balans", value: "${data.balance} so'm", icon: Icons.currency_bitcoin),
          ListModel(label: "Tolov uchun id raqam", value: data.paymentId.toString(), icon: Icons.payment_sharp),
        ];
        return ListsWidget(items: items);
      },
    );
  }
}
