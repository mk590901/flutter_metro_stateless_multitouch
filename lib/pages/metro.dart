import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/interfaces/I_refresh.dart';
import '/common.dart';
import '/custom_grid_tile.dart';
import '../states/drawing_state.dart';
import '../events/refresh_events.dart';
import '../events/event.dart';
import '../refreshing_bloc.dart';
import '../src/widgets/staggered_grid.dart';
import '../src/widgets/staggered_grid_tile.dart';

class MetroPage extends StatelessWidget implements IRefresh {
  const MetroPage({
    Key? key,
  }) : super(key: key);

  static final tiles = [
    CustomGridTile(0, 2, 2),
    CustomGridTile(1, 2, 1),
    CustomGridTile(2, 1, 2),
    CustomGridTile(3, 1, 1),
    CustomGridTile(4, 2, 2),
    CustomGridTile(5, 1, 2),
    CustomGridTile(6, 1, 1),
    CustomGridTile(7, 3, 1),
    CustomGridTile(8, 1, 1),
    CustomGridTile(9, 4, 1),
  ];

  void update(int id) {
    for (CustomGridTile element in tiles) {
      if ((element.id == id) || (id == -1)) {
        element.enable = true;
      } else {
        element.enable = false;
      }
    }
  }

  @override
  void refresh(BuildContext context, int id) {
    update(id);
    Event? event = Refresh();
    context.read<RefreshingBloc>().add(event);
  }

  @override
  void refresh_(BuildContext context) {
    refresh(context, -1);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Metro Style Page BLoC',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refresh_(context);
        },
        tooltip: 'Refresh page',
        child: const Icon(Icons.refresh),
      ),
      child: BlocBuilder<RefreshingBloc, RefreshingState>(builder: (ctx, state) {
        return SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              ...tiles.mapIndexed((index, tile) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: tile.crossAxisCount,
                  mainAxisCellCount: tile.mainAxisCount,
                  child: ImageTile(
                    object: this,
                    id: tile.id,
                    index: tile.next(),
                    width: tile.crossAxisCount * 100,
                    height: tile.mainAxisCount * 100,
                  ),
                );
              }),
            ],
          ),
        ); // This trailing comma makes auto-formatting nicer for build methods.
      }),
    );
  }
}
