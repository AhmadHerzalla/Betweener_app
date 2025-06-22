import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/provider/link_provider.dart';
import 'package:tt9_betweener_challenge/provider/sender_provider.dart';

import 'package:tt9_betweener_challenge/views_featuers/link/add_link_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/home/home_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/loading/loading_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/main_app_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/profile/profile_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/receive/receive_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/auth/register_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/searsh/search_view.dart';

//import 'core/util/constants.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => LinkProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SenderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Betweener',
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: kPrimaryColor,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            scaffoldBackgroundColor: kScaffoldColor),
        home: const LoadingView(),
        routes: {
          LoadingView.id: (context) => const LoadingView(),
          SearchView.id: (context) => const SearchView(),
          AddLink.id: (context) => const AddLink(),
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
          HomeView.id: (context) => const HomeView(),
          MainAppView.id: (context) => const MainAppView(),
          ProfileView.id: (context) => const ProfileView(),
          ReceiveView.id: (context) => const ReceiveView(),
        },
      ),
    );
  }
}
