import 'package:birderapp/widgets/birderapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/birdlist_changenotifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => BirdListChangeNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BirderApp(),
      ),
    ),
  );
}
