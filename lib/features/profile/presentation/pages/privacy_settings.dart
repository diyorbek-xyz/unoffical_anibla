import 'package:application/features/common/presentation/widgets/list.dart';
import 'package:application/features/profile/data/mapper/profile_mapper.dart';
import 'package:application/features/profile/data/models/profile/profile_model.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:application/features/profile/presentation/bloc/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacySettings extends StatelessWidget {
  const PrivacySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state is! ProfileSuccess;
        final fake = ProfileMapper.modelToEntity(ProfileModel());
        final setings = isLoading ? fake.privacySettings : state.data.privacySettings;
        return ListsWidget(
          items: [
            ListModel(
              icon: Icons.message,
              label: "Kommentlarni korsatish",
              value: "Boshqalar siz yozgan izohlarni korishini sozlash",
              actions: [Switch(value: setings.showComments, onChanged: (value) {})],
            ),
            ListModel(
              icon: Icons.bookmark,
              label: "Sevimlilarni korsatish",
              value: "Boshqalar siz saqlagan animelarni korishini sozlash",
              actions: [Switch(value: setings.showFavorites, onChanged: (value) {})],
            ),
          ],
        );
      },
    );
  }
}
