import 'package:application/features/animes/domain/entities/saved_medias.dart';
import 'package:application/features/animes/presentation/controller/saved_controller.dart';
import 'package:application/features/animes/presentation/widgets/anime_card.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SavedsPage extends StatefulWidget {
  const SavedsPage({super.key});

  @override
  State<SavedsPage> createState() => _SavedsPageState();
}

class _SavedsPageState extends State<SavedsPage> {
  late final SavedController savedController;

  @override
  void initState() {
    super.initState();
    savedController = sl();
  }

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (context) {
        final state = savedController.savedMediaSignal.value;
        final data = state.value ?? SavedMedias();
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              CupertinoSliverRefreshControl(onRefresh: savedController.refreshSaveds),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 9 / 15,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: data.movies.length,
                itemBuilder: (context, index) => AnimeCard(aspectRatio: 9 / 15, anime: data.movies[index]),
              ),
              SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  childAspectRatio: 9 / 15,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: data.series.length,
                itemBuilder: (context, index) => AnimeCard(aspectRatio: 9 / 15, anime: data.series[index]),
              ),
            ],
          ),
        );
      },
    );
  }
}
