import '../custom_grid_tile.dart';

abstract class ITransitionMethod {
  void execute([List<CustomGridTile>? data]);
}