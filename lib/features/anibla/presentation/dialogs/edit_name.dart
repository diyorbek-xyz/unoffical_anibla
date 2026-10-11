import 'package:application/features/anibla/presentation/controllers/profile_controller.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';

void showEditProfileName(BuildContext context) => showDialog(context: context, builder: (_) => EditNameDialog());

class EditNameDialog extends StatefulWidget {
  const EditNameDialog({super.key});

  @override
  State<EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<EditNameDialog> {
  final fieldController = TextEditingController();
  void changeName() {
    sl<ProfileController>().changeName(fieldController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: .zero,
      contentPadding: .all(10),
      actionsPadding: .all(10),
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      actionsAlignment: .center,
      actions: [
        OutlinedButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        FilledButton(onPressed: changeName, child: Text("Confirm")),
      ],
      content: TextField(
        controller: fieldController,
        autofocus: true,
        decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Yangi ismni kiriting"),
      ),
    );
  }
}
