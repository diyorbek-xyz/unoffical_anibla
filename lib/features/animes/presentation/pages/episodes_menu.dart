import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/animes/data/mapper/episode_mapper.dart';
import 'package:application/features/animes/domain/entities/anime_entity.dart';
import 'package:application/features/animes/domain/entities/episode_entity.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_bloc.dart';
import 'package:application/features/animes/presentation/bloc/episode/episode_state.dart';
import 'package:application/features/player/data/model/download/completed_models.dart';
import 'package:application/features/player/data/model/parser_models.dart';
import 'package:application/features/player/data/model/service/download_models.dart';
import 'package:application/features/player/data/services/download_service.dart';
import 'package:application/injection_container.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnimeEpisodesMenu extends StatefulWidget {
  final AnimeEntity anime;
  const AnimeEpisodesMenu({super.key, required this.anime});

  @override
  State<AnimeEpisodesMenu> createState() => _AnimeEpisodesMenuState();
}

class _AnimeEpisodesMenuState extends State<AnimeEpisodesMenu> {
  void openDownloadMenu(EpisodeEntity episode) => showDialog(
    context: context,
    builder: (dialog) => DownloadMenu(episode: episode),
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
                final isLoading = state is! EpisodeSuccess;
                final fake = List.generate(10, (index) => EpisodeMapper.modelToEntity(null));
                final episodes = isLoading ? fake : state.episodes;
                return Skeletonizer.sliver(enabled: isLoading, child: list(episodes, context));
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

class DownloadMenu extends StatefulWidget {
  final EpisodeEntity episode;
  const DownloadMenu({super.key, required this.episode});

  @override
  State<DownloadMenu> createState() => _DownloadMenuState();
}

class _DownloadMenuState extends State<DownloadMenu> {
  final downloader = sl<HlsDownloadService>();
  DownloadTask? task;
  MasterPlaylist? masterPlaylist;
  bool isLoading = false;

  @override
  void initState() {
    final dwTask = downloader.getTask(widget.episode.id);
    setState(() => task = dwTask);
    super.initState();
  }

  void getVariants() async {
    setState(() => isLoading = true);
    final url = await downloader.getUrlFromStream(widget.episode.video);
    final master = await downloader.downloadMasterPlaylist(url.file!, "${widget.episode.anime.id}/${widget.episode.season.id}/${widget.episode.id}");
    setState(() {
      masterPlaylist = master;
      isLoading = false;
    });
  }

  void downloadEpisode(Variant variant) async {
    setState(() => isLoading = true);
    final dwTask = await downloader.download(
      DownloadInfos.fromEpisode(widget.episode).copyWith(variant: variant, masterPlaylist: masterPlaylist, downloadUrl: masterPlaylist!.downloadUrl),
    );
    setState(() {
      task = dwTask;
      isLoading = false;
    });
  }

  void goToWatch([String? url]) {
    context.pushNamed("watch", queryParameters: {"episode": widget.episode.episodeNumber.toString(), "type": AnimeType.serie, "url": url});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return AlertDialog(
      constraints: !isMobile ? .tightFor(width: 500, height: 500) : BoxConstraints(minWidth: 500, minHeight: 400, maxHeight: 1024, maxWidth: 720),
      insetPadding: isMobile ? .all(0) : .all(5),
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      actionsAlignment: .end,
      actionsOverflowAlignment: .end,
      title: Row(
        children: [
          Expanded(child: Text("${widget.episode.episodeNumber}-qism ~ ${widget.episode.title.uz}", style: context.textTheme.headlineMedium)),
          IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
        ],
      ),
      content: Column(
        crossAxisAlignment: .stretch,
        children: [
          mainBuilder(),
          Wrap(
            spacing: 5,
            crossAxisAlignment: .end,
            alignment: .center,
            runSpacing: 5,
            children: [
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(shape: context.buttonVariant.rectangle.shape),
                icon: Icon(Icons.bookmark_sharp),
                label: Text("Saqlash"),
              ),
              TextButton.icon(
                onPressed: getVariants,
                style: ButtonStyle(shape: context.buttonVariant.rectangle.shape),
                icon: Icon(Icons.download_sharp),
                label: Text("Yuklab olish"),
              ),
              FilledButton.icon(
                onPressed: goToWatch,
                style: ButtonStyle(shape: context.buttonVariant.rectangle.shape),
                icon: Icon(Icons.remove_red_eye_sharp),
                label: Text("Tomosha qilish"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Builder mainBuilder() {
    return Builder(
      builder: (context) {
        final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
        final isCompleted = task?.isCompleted ?? false;
        final isNotReady = !(task == null || task!.streamController == null) || isCompleted;

        return Expanded(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : !isNotReady
              ? variantsBuilder()
              : Column(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .start,
                  children: [
                    SizedBox(height: 20),
                    StreamBuilder<DownloadState>(
                      stream: task!.streamController?.stream,
                      builder: (context, snapshot) {
                        if (snapshot.data == null && !isCompleted && task == null) return Text("Yuklanmoqda");
                        final dwTask = task!;
                        final state = snapshot.data;
                        final isDownloaded = dwTask.isCompleted || state?.status == .completed;
                        final speedKb = state?.speed ?? 0;
                        final totalMb = state?.totalSize ?? dwTask.mediaPlaylist.sizeByte / (1024 * 1024);
                        final downloadedMb = state?.downloadedSize ?? totalMb;
                        final progress = ((state?.progress ?? ((state?.status == .completed) ? 1 : 0)) * (dwTask.sizeByte / (1024 * 1024)));
                        final estimatedAny = (totalMb - progress) / (speedKb / 1024);
                        final estimated = Duration(seconds: estimatedAny.isFinite ? estimatedAny.toInt() : 0).toCountdown();
                        final isPaused = state == null || state.status == .paused || state.status == .cancelled;
                        return Wrap(
                          spacing: 40,
                          runSpacing: 40,
                          crossAxisAlignment: .start,
                          alignment: .center,
                          runAlignment: .spaceEvenly,
                          children: [
                            SizedBox.square(
                              dimension: 150,
                              child: Stack(
                                alignment: .center,
                                fit: .expand,
                                children: [
                                  CircularProgressIndicator(
                                    value: isDownloaded ? 1 : state?.progress ?? 0,
                                    strokeWidth: 10,
                                    backgroundColor: context.appColors.primary.withAlpha(60),
                                    strokeCap: StrokeCap.round,
                                    constraints: BoxConstraints.tightFor(width: 100, height: 100),
                                  ),
                                  Center(
                                    child: SizedBox.square(
                                      dimension: 70,
                                      child: IconButton(
                                        onPressed: () => !isDownloaded ? downloader.toggle(dwTask.id) : null,
                                        iconSize: 40,
                                        icon: Icon(
                                          isDownloaded
                                              ? Icons.download_done
                                              : isPaused
                                              ? Icons.play_arrow
                                              : Icons.pause,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: isMobile ? .stretch : .start,
                              spacing: 3,
                              children: [
                                Text("Yuklandi: \t ${downloadedMb.toStringAsFixed(1)}Mb", style: context.textTheme.labelLarge),
                                Text("Hammasi: \t ${totalMb.toStringAsFixed(1)}Mb", style: context.textTheme.labelLarge),
                                Text("Tezlik: \t ${speedKb.toStringAsFixed(2)}Kb/s", style: context.textTheme.labelLarge),
                                Text("Qolgan vaqt: \t $estimated", style: context.textTheme.labelLarge),
                                SizedBox(height: 15),
                                if (progress > 0.3 || isDownloaded)
                                  TextButton(
                                    onPressed: () => goToWatch(task?.mediaPlaylist.localUrl),
                                    style: ButtonStyle(
                                      shape: context.buttonVariant.rectangle.shape,
                                      backgroundColor: WidgetStatePropertyAll(Colors.green.shade900.withAlpha(100)),
                                      foregroundColor: WidgetStatePropertyAll(Colors.green.shade200),
                                      textStyle: WidgetStatePropertyAll(context.textTheme.labelLarge),
                                    ),
                                    child: Text("Tomosha qilish"),
                                  ),
                                TextButton(
                                  onPressed: () => downloader.cancel(state?.id ?? task!.id),
                                  style: ButtonStyle(
                                    shape: context.buttonVariant.rectangle.shape,
                                    backgroundColor: WidgetStatePropertyAll(context.appColors.errorContainer.withAlpha(100)),
                                    foregroundColor: WidgetStatePropertyAll(context.appColors.onErrorContainer),
                                    textStyle: WidgetStatePropertyAll(context.textTheme.labelLarge),
                                  ),
                                  child: Text(isDownloaded ? "O'chirish" : "Bekor qilish"),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget variantsBuilder() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 10,
      children: [
        Text("Video sifatini tanlang:", style: context.textTheme.titleMedium),
        Expanded(
          child: ListView(
            children:
                masterPlaylist?.variants
                    .map(
                      (e) => ListTile(
                        onTap: () => downloadEpisode(e),
                        subtitle: Text("1daqiqa ~ ${((e.bandwidth * 60) / (8 * 1024 * 1024)).toStringAsFixed(1)}Mb"),
                        title: Text("${e.width}p"),
                      ),
                    )
                    .toList() ??
                [],
          ),
        ),
      ],
    );
  }
}
