import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/data/model/download_models.dart';
import 'package:application/features/player/data/services/download_service.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeEpisodesMenu extends StatefulWidget {
  final AnimeEntity anime;
  const AnimeEpisodesMenu({super.key, required this.anime});

  @override
  State<AnimeEpisodesMenu> createState() => _AnimeEpisodesMenuState();
}

class _AnimeEpisodesMenuState extends State<AnimeEpisodesMenu> {
  final downloader = sl<HlsDownloadService>();
  void openDownloadMenu(EpisodeEntity episode) => showDialog(
    context: context,
    builder: (dialog) => Dialog(
      constraints: BoxConstraints.loose(Size(500, 400)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          children: [
            Text("Yuklab olish", style: context.textTheme.headlineMedium),
            StreamBuilder(
              stream: downloader.stream,
              builder: (context, snapshot) {
                final task = downloader.getTask(episode.id);
                final state = downloader.states[episode.id];
                final isDownloaded = task?.isCompleted ?? state?.status == .completed;
                final speedKb = state?.speed ?? 0;
                final totalMb = ((task?.extraInfo.totalSize ?? 0) / (1024 * 1024));
                final progress = ((state?.progress ?? ((state?.status == .completed) ? 1 : 0)) * ((task?.extraInfo.totalSize ?? 0) / (1024 * 1024)));
                final estimatedAny = (totalMb - progress) / (speedKb / 1024);
                final estimated = Duration(seconds: estimatedAny.isFinite ? estimatedAny.toInt() : 0).toCountdown();
                final isPaused = (state == null || state.status == .paused);
                return Row(
                  spacing: 5,
                  children: [
                    if (isDownloaded)
                      IconButton(
                        onPressed: () => !isDownloaded ? downloader.toggle(episode.id) : null,
                        icon: Icon(
                          isDownloaded
                              ? Icons.download_done
                              : isPaused
                              ? Icons.download
                              : Icons.pause,
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          LinearProgressIndicator(value: isDownloaded ? 1 : state?.progress ?? 0),
                          Text.rich(
                            style: context.textTheme.labelSmall,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: isDownloaded
                                      ? "${totalMb.toStringAsFixed(1)} Mb"
                                      : "${progress.toStringAsFixed(1)}/${totalMb.toStringAsFixed(1)} Mb\t ",
                                ),
                                if (!isDownloaded) ...[TextSpan(text: "${speedKb.toStringAsFixed(2)} Kb/s\t"), TextSpan(text: "$estimated qoldi")],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () => downloader.cancel(episode.id), icon: Icon(Icons.delete)),
                  ],
                );
              },
            ),
            FilledButton.icon(onPressed: () => downloader.downloadFromStream(DownloaderProps.fromEpisode(episode)), label: Text("Download")),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("episodes"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            BlocBuilder<EpisodeBloc, EpisodeState>(
              builder: (context, state) {
                switch (state) {
                  case EpisodeLoading():
                  case EpisodeSuccess():
                    final isLoading = state is! EpisodeSuccess;
                    final fake = List.generate(10, (index) => EpisodeMapper.modelToEntity(null));
                    final episodes = isLoading ? fake : state.episodes;
                    return Skeletonizer.sliver(enabled: isLoading, child: list(episodes, context));
                  case EpisodeFailure():
                    return SliverFillRemaining(child: Center(child: Text(state.message)));
                  default:
                    return SliverFillRemaining(child: Text("Nimadur xato ketti"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget list(List<EpisodeEntity> episodes, BuildContext context) {
    return SliverGrid.extent(
      maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: episodes
          .map(
            (e) => InkWell(
              onTap: () => openDownloadMenu(e),
              hoverColor: context.appColors.primaryContainer.withAlpha(70),
              splashColor: context.appColors.primaryContainer.withAlpha(70),
              focusColor: context.appColors.primaryContainer.withAlpha(70),
              highlightColor: context.appColors.primaryContainer.withAlpha(70),
              borderRadius: BorderRadius.circular(16),
              mouseCursor: SystemMouseCursors.click,
              child: Align(alignment: AlignmentGeometry.center, child: Text("${e.episodeNumber}-qism")),
            ),
          )
          .toList(),
    );
  }
}
