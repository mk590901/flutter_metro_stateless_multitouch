import 'package:flutter/material.dart';
import '../custom_grid_tile.dart';
import 'i_transition_method.dart';

class OnNothing implements ITransitionMethod {
  @override

  void execute([List<CustomGridTile>? hashMap]) {
    print ("@OnNothing $hashMap");
  }

}
