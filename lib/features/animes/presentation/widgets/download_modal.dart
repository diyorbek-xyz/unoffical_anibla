import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/download/download_bloc.dart';
import 'package:application/features/animes/presentation/bloc/download/download_event.dart';
import 'package:application/features/animes/presentation/bloc/download/download_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showDownloadModal(BuildContext context, EpisodeEntity episode) {
  final bloc = context.read<DownloadBloc>();
  final isInitial = bloc.state is DownloadInitial;
  if (isInitial) bloc.add(GetInfoDownload(episode.video));
  showDialog(
    context: context,
    builder: (dialog) => BlocBuilder<DownloadBloc, DownloadState>(
      bloc: bloc,
      builder: (context, state) {
        final hasInfo = state is DownloadInfo;
        final hasError = state is DownloadFailed;
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text(hasError ? "Chiqish" : "Bekor qilish"),
            ),
            if (hasInfo) FilledButton(onPressed: () => context.pop(), child: Text("Yuklab olish")),
          ],
          constraints: BoxConstraints(
            maxWidth: 1000,
            minWidth: 400,
            minHeight: 400,
            maxHeight: 500,
          ),
          title: Text("Video sifatini tanlang"),
          backgroundColor: context.appColors.primaryContainer,
          content: Builder(
            builder: (context) {
              switch (state) {
                case DownloadGettingInfo():
                  return Center(child: CircularProgressIndicator());
                case DownloadFailed():
                  return Center(child: Text(state.message));
                case DownloadInfo():
                  return SizedBox(
                    width: 400,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.master.variants.length,
                      itemBuilder: (context, index) {
                        final variant = state.master.variants.elementAt(index);
                        final format = variant.format;
                        return ListTile(
                          onTap: () => bloc.add(StartDownload(state.master, variant)),
                          title: Text("${format.height}p"),
                        );
                      },
                    ),
                  );
                default:
                  return Center(
                    child: IconButton(
                      onPressed: () => bloc.add(GetInfoDownload(episode.video)),
                      icon: Icon(Icons.download),
                    ),
                  );
              }
            },
          ),
        );
      },
    ),
  );
}
