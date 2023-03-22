import 'package:flutter/material.dart';
import 'interfaces/I_refresh.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.title,
    this.topPadding = 0,
    required this.child,
    required this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final Widget child;
  final Widget floatingActionButton;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.object,
    required this.id,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  final IRefresh object;
  final int id;
  final int index;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    String path = 'https://picsum.photos/$width/$height?random=$index';
    return Scaffold(
      body: Listener(
        onPointerDown: (e) {
          print('Down  [$id]');
        },
        onPointerMove: (e) {
          print('Move  [$id]');
        },
        onPointerUp: (e) {
          print('Up    [$id]');
          object.refresh(context, id);
        },
        onPointerCancel: (e) {
          print('Cancel [$id]');
        },
        child: Image.network(
          path,
          width: width.toDouble(),
          height: height.toDouble(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
