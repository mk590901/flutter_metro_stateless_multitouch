import 'package:flutter/material.dart';

abstract class IRefresh {
  void refresh(BuildContext context, int id);
  void refresh_(BuildContext context);
}