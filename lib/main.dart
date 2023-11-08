import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seequl/app.dart';
import 'package:seequl/core/provider/ToShowProvider.dart';
import 'package:seequl/core/storage/storage.dart';

Future<void> main() async {
  /// initialize app storage
  await initStorage();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ToShowProvider()),
    ],
    child: const SeeQulApp(),
  ));
}
