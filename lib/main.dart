import 'package:birderapp/screens/add_new_bird_screen.dart';
import 'package:birderapp/widgets/bird_splash_screen.dart';
import 'package:birderapp/widgets/birderapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/birdlist_changenotifier.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => BirdListChangeNotifier(),
    child: MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                  color: Colors.white, fontFamily: 'Pacifico', fontSize: 60.0),
            ),
      ),
      //initialRoute: '/',
      home: BirdSplashScreen(),
      routes: {
        BirderApp.routeName: (ctx) => BirderApp(),
        AddNewBird.routeName: (ctx) => AddNewBird(),
      },
    ),
  ));
}
